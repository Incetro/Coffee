//
//  QuickActionsConfigurator.swift
//  Venue
//
//  Created by incetro on 30/01/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - QuickActionsConfigurator

final class QuickActionsConfigurator {

    /// UIApplication instance
    private let application: UIApplication

    /// Bundle instance
    private let bundle: Bundle

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameters:
    ///   - application: UIApplication instance
    ///   - bundle: Bundle instance
    init(application: UIApplication, bundle: Bundle) {
        self.application = application
        self.bundle = bundle
    }
}

// MARK: - Configurator

extension QuickActionsConfigurator: Configurator {

    func configure() {
        guard let bundleIdentifier = bundle.bundleIdentifier else {
            return
        }
        if application.shortcutItems?.isEmpty == false {
            application.shortcutItems = []
        }
        let createTaskQuickAction = QuickAction(type: VenueQuickAction.create, title: "Some title", icon: .add)
        let actions = QuickActions(application, bundleIdentifier: bundleIdentifier)
        actions.add(createTaskQuickAction, toApplication: application)
    }
}
