//
//  TransitionHandler.swift
//  Workzilla
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2017 Incetro. All rights reserved.
//

import UIKit

typealias TransitionConfigureBlock<T> = (T) -> Void

// MARK: - ParentType

enum ParentType {
    case most
    case prev
}

// MARK: - TransitionHandler

protocol TransitionHandler: class {

    /// Return current module's input
    var moduleInput: ModuleInput? { get }

    /// Return current module's output
    var moduleOutput: ModuleOutput? { get }

    /// Returns parent transition handler
    /// - Parameter type: parent type
    func parent(_ type: ParentType) -> TransitionHandler?

    /// Transition with ModuleFactory
    ///
    /// - Parameters:
    ///   - moduleFactory: ModuleFactory instance
    ///   - type: ModuleInput type
    /// - Returns: Promise with setups
    func openModule<M>(
        _ moduleType: M.Type
    ) -> ViperTransitionPromise<M.Input> where M: Module, M.View: UIViewController

    /// Transition for advanced modules
    ///
    /// - Parameters:
    ///   - moduleType: whole module type
    ///   - data: data for module initializations
    /// - Returns: Promise with setups
    func openModule<M>(
        _ moduleType: M.Type,
        withData data: M.Data
    ) -> ViperTransitionPromise<M.Input> where M: AdvancedModule, M.View: UIViewController

    /// Standard performSegueWithIdentifier
    ///
    /// - Parameter segueIdentifier: Given segue identifier
    func performSegue(_ segueIdentifier: String)

    /// Transition with segue identifier and setup block
    ///
    /// - Parameters:
    ///   - identifier: Given segue identifier
    ///   - type: Moduleinput type
    func performSegue<T>(identifier: String, to type: T.Type) -> SegueTransitionPromise<T>

    /// Close current module
    func closeCurrentModule() -> CloseTransitionPromise

    /// Write mail to support
    func openMail(usingMailer mailer: Mailer, recipient: String?, subject: String?, body: String?)

    /// Show share menu for some item
    /// - Parameter item: item fot sharing
    func showShareDialog(withItem item: Any)
}

extension TransitionHandler {

    var moduleOutput: ModuleOutput? {
        moduleInput as? ModuleOutput
    }
}

// MARK: - Additions

extension TransitionHandler where Self: UIViewController {

    func parent(_ type: ParentType) -> TransitionHandler? {
        switch type {
        case .prev:
            return parent
        case .most:
            let result = parent == nil ? self : parent?.parent(type)
            switch result {
            case let searchController as UISearchController:
                return searchController.presentingViewController?.parent(type)
            case let navigationController as UINavigationController:
                return navigationController.topViewController
            case let tabBarController as UITabBarController:
                return tabBarController.selectedViewController
            default:
                return result
            }
        }
    }

    func showShareDialog(withItem item: Any) {
        let activityViewController = UIActivityViewController(activityItems: [item], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.airDrop]
        DispatchQueue.main.async {
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
}
