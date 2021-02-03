//
//  Constants.swift
//  Coffee
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
}
