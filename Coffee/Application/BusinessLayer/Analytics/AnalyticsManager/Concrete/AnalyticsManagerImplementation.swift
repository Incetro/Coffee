//
//  AnalyticsManagerImplementation.swift
//  Coffee
//
//  Created by incetro on 17/03/2020.
//  Copyright © 2020 Coffee. All rights reserved.
//

import Foundation

// MARK: - AnalyticsManagerImplementation

final class AnalyticsManagerImplementation {

    // MARK: - Properties

    /// All available analytics engines (Firebase, CloudKit etc.)
    private let engines: [AnalyticsEngine]

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter engines: all available analytics engines (Firebase, CloudKit etc.)
    init(engines: [AnalyticsEngine]) {
        self.engines = engines
    }
}

// MARK: - AnalyticsManager

extension AnalyticsManagerImplementation: AnalyticsManager {

    func log(_ event: AnalyticsEvent) {
        engines.forEach {
            $0.sendAnalyticsEvent(named: event.name, metadata: event.metadata)
        }
    }
}
