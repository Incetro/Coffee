//
//  Constants.swift
//  Venue
//
//  Created by Дмитрий Савинов on 29.10.2020.
//

import HTTPTransport

let environment = Configuration()

// MARK: - Constants

enum Constants {

    static let quickActionItemIdentifierKey = "quickActionItemIdentifierKey"

    // MARK: - UserDefaultsKeys

    enum UserDefaultsKeys: String, CaseIterable {

        case language = "appname.language"
        case notificationRequested = "appname.notifications-request"

        var shouldRemoveOnCleaning: Bool {
            switch self {
            case .notificationRequested:
                return false
            default:
                return true
            }
        }
    }

    // MARK: - Regex

    enum Regex {
        static let email = NSRegularExpression("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
}
