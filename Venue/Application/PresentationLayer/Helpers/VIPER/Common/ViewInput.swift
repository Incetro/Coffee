//
//  ViewInput.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Message
import MBProgressHUD

// MARK: - ViewInput

protocol ViewInput {

    /// Waiting state
    func startIndication()

    /// Waiting state with some text
    func startIndication(withText text: String?, details: String?)

    /// Stop 'Waiting state'
    func stopIndication()

    func showProgress(_ progress: Double)

    /// Show success state
    func showSuccess(withText text: String?)

    /// Show some message
    ///
    /// - Parameter message: Message text
    func showMessage(_ message: String)

    /// Show some error message with retry block
    ///
    /// - Parameters:
    ///   - message: message text
    ///   - block: retry action
    func showMessage(_ message: String, actionBlock block: @escaping () -> Void)

    /// Show some error message
    ///
    /// - Parameter errorMessage: Error message text
    func showErrorMessage(_ errorMessage: String)

    /// Show some error message with retry block
    ///
    /// - Parameters:
    ///   - errorMessage: Error message text
    ///   - block: retry action
    func showErrorMessage(_ errorMessage: String, retryBlock block: @escaping () -> Void)

    /// Show unknown error message
    func showError()

    /// Shows confirmation
    /// - Parameters:
    ///   - title: alert title
    ///   - confirmationBlock: calls if action was confirmed
    func showConfirmationMessage(
        title: String,
        confirmationBlock: @escaping VoidClosure
    )
}

extension ViewInput {

    private var hudAppearance: CMHUDAppearance {
        (self as? Designable).unwrap().designer.appearance.hudAppearance
    }

//    private var alertAppearance: AlertControllerAppearance {
//        (self as? Designable).unwrap().designer.appearance.alertControllerAppearance
//    }

    func startIndication() {
        startIndication(withText: nil, details: nil)
    }

    func startIndication(withText text: String) {
        startIndication(withText: text, details: nil)
    }

    func showSuccess() {
        showSuccess(withText: nil)
    }
}

extension ViewInput where Self: UIView {

    func startIndication(withText text: String?, details: String?) {
        CMHUD.loading(in: self, withAppearance: hudAppearance)
    }

    func stopIndication() {
        CMHUD.hide(from: self)
    }

    func showProgress(_ progress: Double) {
        CMHUD.progress(progress, in: self, withAppearance: hudAppearance)
    }

    func showSuccess(withText text: String?) {
        CMHUD.success(in: self, withAppearance: hudAppearance)
    }

    func showMessage(_ message: String) {
        Alert(withMessage: message).addButton(withTitle: L10n.ok).show()
    }

    func showMessage(_ message: String, actionBlock block: @escaping () -> Void) {
    }

    func showErrorMessage(_ errorMessage: String) {
        if let viewInput = UIApplication.shared.topViewController() as? ViewInput {
            viewInput.showErrorMessage(errorMessage)
        }
    }

    func showErrorMessage(_ errorMessage: String, retryBlock block: @escaping () -> Void) {
        if let viewInput = UIApplication.shared.topViewController() as? ViewInput {
            viewInput.showErrorMessage(errorMessage, retryBlock: block)
        }
    }

    func showError() {
        CMHUD.error(in: self, withAppearance: hudAppearance)
    }

    func showConfirmationMessage(
        title: String,
        confirmationBlock: @escaping VoidClosure
    ) {
        if let viewInput = UIApplication.shared.topViewController() as? ViewInput {
            viewInput.showConfirmationMessage(title: title, confirmationBlock: confirmationBlock)
        }
    }
}

extension ViewInput where Self: UIViewController {

    func startIndication(withText text: String?, details: String?) {
        let view = navigationController?.view ?? self.view.unwrap()
        CMHUD.loading(in: view, withAppearance: hudAppearance)
    }

    func showProgress(_ progress: Double) {
        let view = navigationController?.view ?? self.view.unwrap()
        CMHUD.progress(progress, in: view, withAppearance: hudAppearance)
    }

    func stopIndication() {
        let view = navigationController?.view ?? self.view.unwrap()
        CMHUD.hide(from: view)
    }

    func showSuccess(withText text: String?) {
        let view = navigationController?.view ?? self.view.unwrap()
        CMHUD.success(in: view, withAppearance: hudAppearance)
    }

    func showMessage(_ message: String) {
//        let controller = navigationController ?? self
//        let alertController = AlertController(
//            title: message,
//            actionButtonTitle: L10n.ok,
//            appearance: alertAppearance
//        )
//        controller.present(alertController, animated: true)
    }

    func showMessage(
        _ message: String,
        actionBlock block: @escaping () -> Void
    ) {
//        let controller = tabBarController ?? navigationController ?? self
//        let alertController = AlertController(
//            title: message,
//            actionButtonTitle: L10n.ok,
//            appearance: alertAppearance
//        )
//        alertController.desirableAction = block
//        controller.present(alertController, animated: true)
    }

    func showErrorMessage(_ errorMessage: String) {
//        let controller = tabBarController ?? navigationController ?? self
//        let alertController = AlertController(
//            title: errorMessage,
//            actionButtonTitle: L10n.ok,
//            appearance: alertAppearance
//        )
//        controller.present(alertController, animated: true)
    }

    func showErrorMessage(_ errorMessage: String, retryBlock block: @escaping () -> Void) {
//        let controller = tabBarController ?? navigationController ?? self
//        let alertController = AlertController(
//            title: errorMessage,
//            actionButtonTitle: L10n.ok,
//            cancelButtonTitle: L10n.cancel,
//            appearance: alertAppearance
//        )
//        alertController.desirableAction = block
//        alertController.cancelAction = {}
//        controller.present(alertController, animated: true)
    }

    func showError() {
        CMHUD.error(in: view, withAppearance: hudAppearance)
    }

    func showConfirmationMessage(
        title: String,
        confirmationBlock: @escaping VoidClosure
    ) {
//        let controller = tabBarController ?? navigationController ?? self
//        let alertController = AlertController(
//            title: title,
//            actionButtonTitle: L10n.ok,
//            cancelButtonTitle: L10n.cancel,
//            appearance: alertAppearance
//        )
//        alertController.desirableAction = confirmationBlock
//        alertController.cancelAction = {}
//        controller.present(alertController, animated: true)
    }
}
