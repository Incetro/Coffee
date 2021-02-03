//
//  AnalyticsEngine.swift
//  Coffee
//
//  Created by incetro on 17/03/2020.
//  Copyright © 2020 Coffee. All rights reserved.
//

import Foundation

// MARK: - AnalyticsEngine

protocol AnalyticsEngine: class {

    /// Send some analytics event
    ///
    /// - Parameters:
    ///   - name: event name
    ///   - metadata: event metadata
    func sendAnalyticsEvent(named name: String, metadata: [String: String])
}
