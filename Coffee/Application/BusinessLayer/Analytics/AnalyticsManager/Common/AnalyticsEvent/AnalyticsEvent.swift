//
//  AnalyticsEvent.swift
//  Coffee
//
//  Created by incetro on 17/03/2020.
//  Copyright © 2020 Coffee. All rights reserved.
//

// MARK: - AnalyticsEvent

/// Событие для отправки аналитической информации
enum AnalyticsEvent {

    // MARK: - AuthMethod

    /// Used auth method
    enum AuthMethod: String {

        /// Phone number
        case phone
    }

    case signInButtonTapped(AuthMethod)
}

// MARK: - Name

extension AnalyticsEvent {

    var name: String {
        switch self {
        case .signInButtonTapped(let method):
            return method.rawValue
        }
    }
}

// MARK: - Metadata

extension AnalyticsEvent {

    var metadata: [String: String] {
        [:]
    }
}

// MARK: - Equatable

extension AnalyticsEvent: Equatable {

    static func == (lhs: AnalyticsEvent, rhs: AnalyticsEvent) -> Bool {
        lhs.name == rhs.name
    }
}
