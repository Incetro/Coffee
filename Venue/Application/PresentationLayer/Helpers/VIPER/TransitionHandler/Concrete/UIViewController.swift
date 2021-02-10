//
//  UIViewController.swift
//  Workzilla
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2017 Incetro. All rights reserved.
//

import UIKit
import Message
import MessageUI

// MARK: - TransitionHandler

extension UIViewController: TransitionHandler {

    var moduleInput: ModuleInput? {
        if let provider = self as? ViewOutputProvider {
            if let result = provider.viewOutput {
                return result
            } else {
                fatalError("Your UIViewController must return ModuleInput!")
            }
        } else {
            fatalError("Your UIViewController must implement protocol 'ViewOutputProvider'!")
        }
    }

    func performSegue<T>(identifier: String, to type: T.Type) -> SegueTransitionPromise<T> {
        let promise = SegueTransitionPromise(identifier: identifier, source: self, for: type)
        promise.promise {}
        return promise
    }

    func openModule<M>(
        _ moduleType: M.Type
    ) -> ViperTransitionPromise<M.Input> where M: Module, M.View: UIViewController {
        let destination = M.instantiate()
        let promise = ViperTransitionPromise(source: self, destination: destination, for: M.Input.self)
        promise.promise { [weak self] in
            self?.present(destination, animated: true, completion: nil)
        }
        return promise
    }

    func openModule<M>(
        _ moduleType: M.Type,
        withData data: M.Data
    ) -> ViperTransitionPromise<M.Input> where M: AdvancedModule, M.View: UIViewController {
        let destination = M.instantiate(withData: data)
        let promise = ViperTransitionPromise(source: self, destination: destination, for: M.Input.self)
        promise.promise { [weak self] in
            self?.present(destination, animated: true, completion: nil)
        }
        return promise
    }

    func performSegue(_ segueIdentifier: String) {
        DispatchQueue.main.async { [weak self] in
            self?.performSegue(withIdentifier: segueIdentifier, sender: nil)
        }
    }

    func closeCurrentModule() -> CloseTransitionPromise {
        let close = CloseTransitionPromise(source: self)
        close.promise { [unowned self] in
            if let parent = self.parent {
                if let navigationController = parent as? UINavigationController {
                    if navigationController.children.count > 1 {
                        navigationController.popViewController(animated: close.isAnimated)
                    } else if let presentedViewController = navigationController.presentedViewController {
                        presentedViewController.dismiss(animated: close.isAnimated)
                    } else if navigationController.children.count == 1 {
                        navigationController.dismiss(animated: close.isAnimated)
                    }
                } else {
                    self.removeFromParent()
                    self.view.removeFromSuperview()
                }
            } else if self.presentingViewController != nil {
                self.dismiss(animated: close.isAnimated)
            }
        }
        return close
    }

    func openMail(usingMailer mailer: Mailer, recipient: String?, subject: String?, body: String?) {
        if MFMailComposeViewController.canSendMail() {
            openMail(
                recipient: recipient ?? "",
                subject: subject,
                body: body
            )
        } else {
            let clients = MailClient.all.filter { mailer.isMailClientAvailable($0) && $0 != .mail }
            if clients.isEmpty {
                Alert(withTitle: L10n.Support.Unavailable.title,
                      message: L10n.Support.Unavailable.message
                    )
                    .show(andCloseAfter: 2)
            } else {
                if clients.count > 1 {
                    let alert = Alert(
                        withTitle: L10n.Support.ChooseMailClient.title,
                        message: L10n.Support.ChooseMailClient.message
                    )
                    for client in clients {
                        _ = alert.addButton(withTitle: client.name) { _ in
                            mailer.openMailClient(client, recipient: recipient, subject: subject, body: body)
                        }
                    }
                    alert.addCancelButton(withTitle: L10n.cancel).show(in: self)
                } else if let client = clients.first {
                    mailer.openMailClient(client, recipient: recipient, subject: subject, body: body)
                }
            }
        }
    }

    private func openMail(
        recipient: String,
        subject: String?,
        body: String?
    ) {
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients([recipient])
        if let subject = subject {
            mail.setSubject(subject)
        }
        if let body = body {
            mail.setMessageBody(body, isHTML: false)
        }
        present(mail, animated: true)
    }
}

// MARK: - UINavigationControllerDelegate

extension UIViewController: UINavigationControllerDelegate {
}

// MARK: - MFMailComposeViewControllerDelegate

extension UIViewController: MFMailComposeViewControllerDelegate {

    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true)
    }
}

// MARK: - Swizzling

extension UIViewController {

    class Value {

        let value: Any?

        init(_ value: Any?) {
            self.value = value
        }
    }

    @nonobjc static var PrepareForSegueKey = "com.incetro.method.prepareForSegue"

    var performSegueConfig: PerformSegueConfig? {
        get {
            let value = objc_getAssociatedObject(self, &UIViewController.PrepareForSegueKey) as? Value
            return value?.value as? PerformSegueConfig
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.PrepareForSegueKey, Value(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    typealias PerformSegueConfig = (UIStoryboardSegue) throws -> Void

    func performSegue(withIdentifier identifier: String, sender: Any?, completion: @escaping PerformSegueConfig) {
        swizzlePrepareForSegue()
        performSegueConfig = completion
        performSegue(withIdentifier: identifier, sender: sender)
    }

    func swizzlePrepareForSegue() {
        DispatchQueue.once(token: "com.incetro.swizzle") {
            let originalMethodSelector = #selector(UIViewController.prepare(for:sender:))
            let swizzledMethodSelector = #selector(UIViewController.swizzledPrepare(for:sender:))
            let controllerClass = UIViewController.self
            let originalMethod = class_getInstanceMethod(controllerClass, originalMethodSelector)
            let swizzledMethod = class_getInstanceMethod(controllerClass, swizzledMethodSelector)
            let needed = class_addMethod(controllerClass,
                                         originalMethodSelector,
                                         method_getImplementation(swizzledMethod.unwrap()),
                                         method_getTypeEncoding(swizzledMethod.unwrap()))
            if needed {
                class_replaceMethod(controllerClass,
                                    swizzledMethodSelector,
                                    method_getImplementation(originalMethod.unwrap()),
                                    method_getTypeEncoding(originalMethod.unwrap()))
            } else {
                method_exchangeImplementations(originalMethod.unwrap(), swizzledMethod.unwrap())
            }
        }
    }

    @objc func swizzledPrepare(for segue: UIStoryboardSegue, sender: Any?) {
        try? performSegueConfig?(segue)
        swizzledPrepare(for: segue, sender: sender)
        performSegueConfig = nil
    }
}
