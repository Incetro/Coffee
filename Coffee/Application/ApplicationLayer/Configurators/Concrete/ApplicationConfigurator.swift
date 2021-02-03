//
//  ApplicationConfigurator.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit
import UserNotifications

// MARK: - ApplicationConfigurator

final class ApplicationConfigurator {

    // MARK: - Properties

    /// Current application instance
    private let application: UIApplication

    /// Localizer instance
    private let localizer: Localizer

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter application: current application instance
    /// - Parameter localizer: Localizer instance
    init(application: UIApplication, localizer: Localizer) {
        self.application = application
        self.localizer = localizer
    }
}

// MARK: - Configurator

extension ApplicationConfigurator: Configurator {

    func configure() {
        L10n.bundle = Bundle(path: localizer.currentLanguage.localizedPath)
    }
}
