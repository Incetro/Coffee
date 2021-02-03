//
//  SettingsRevealableRouter.swift
//  Coffee
//
//  Created by Дмитрий Савинов on 02.11.2020.
//

import UIKit

// MARK: - SettingsRevealableRouter

class SettingsRevealableRouter: Router {

    /// UIApplication instance
    let application: UIApplication

    /// Bundle instance
    let bundle: Bundle

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - transitionHandler: transition handler instance
    ///   - application: UIApplication instance
    ///   - bundle: Bundle instance
    init(
        transitionHandler: TransitionHandler,
        application: UIApplication,
        bundle: Bundle
    ) {
        self.application = application
        self.bundle = bundle
        super.init(transitionHandler: transitionHandler)
    }

    // MARK: - SettingsRevealableRouterInput

    final func openSettings() {
        guard
            let bundleIdentifier = bundle.bundleIdentifier,
            let settingsUrl = URL(string: UIApplication.openSettingsURLString + bundleIdentifier)
        else { return }
        application.open(settingsUrl)
    }
}
