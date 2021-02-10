//
//  ExternalDependenciesConfigurator.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Sentry
import AppCenter
import AppCenterCrashes
import AppCenterAnalytics

// MARK: - ExternalDependenciesConfigurator

final class ExternalDependenciesConfigurator {

    /// VenueConfiguration instance
    private let configuration: VenueConfiguration

    /// Default initializer
    /// - Parameter configuration: VenueConfiguration instance
    init(configuration: VenueConfiguration) {
        self.configuration = configuration
    }

    // MARK: - Private

    private func setupAppCenter() {
        AppCenter.start(
            withAppSecret: configuration.appCenterToken,
            services: [
                Analytics.self,
                Crashes.self
            ]
        )
    }

    private func setupSentry() {
        SentrySDK.start { options in
            options.dsn = "dsn"
            options.debug = true
        }
    }
}

// MARK: - Configurator

extension ExternalDependenciesConfigurator: Configurator {

    func configure() {
    }
}
