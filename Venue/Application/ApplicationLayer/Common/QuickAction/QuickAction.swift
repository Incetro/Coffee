//
//  QuickAction.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - QuickAction

struct QuickAction {

    // MARK: - Properties

    /// Quick action type
    let type: String

    /// Action title
    let title: String

    /// Action subtitle (if needed)
    let subtitle: String?

    /// Action icon (if needed)
    let icon: QuickActionIcon?

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameters:
    ///   - type: quick action type
    ///   - title: action title
    ///   - subtitle: action subtitle (if needed)
    ///   - icon: action icon (if needed)
    init<T: QuickActionType>(type: T, title: String, subtitle: String? = nil, icon: QuickActionIcon? = nil) {
        self.type = type.value
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
    }

    // MARK: - Useful methods

    /// Convert current instance to UIApplicationShortcutItem
    ///
    /// - Parameter bundleIdentifier: application identifier
    /// - Returns: UIApplicationShortcutItem instance
    func toApplicationShortcut(_ bundleIdentifier: String) -> UIApplicationShortcutItem {
        let userInfo: [String: Any] = [
            Constants.quickActionItemIdentifierKey: type
        ]
        return UIApplicationShortcutItem(type: bundleIdentifier + "." + type,
                                         localizedTitle: title,
                                         localizedSubtitle: subtitle,
                                         icon: icon?.toApplicationShortcutIcon(),
                                         userInfo: userInfo as? [String: NSSecureCoding])
    }
}
