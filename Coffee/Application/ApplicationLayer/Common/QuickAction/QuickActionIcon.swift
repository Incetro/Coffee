//
//  QuickActionIcon.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - QuickActionIcon

enum QuickActionIcon: Int {

    case compose
    case play
    case pause
    case add
    case location
    case search
    case share
    case prohibit
    case contact
    case home
    case markLocation
    case favorite
    case love
    case cloud
    case invitation
    case confirmation
    case mail
    case message
    case date
    case time
    case capturePhoto
    case captureVideo
    case task
    case taskCompleted
    case alarm
    case bookmark
    case shuffle
    case audio
    case update
    case custom

    /// Convert current instance to UIApplicationShortcutItem
    ///
    /// - Returns: UIApplicationShortcutItem instance
    func toApplicationShortcutIcon() -> UIApplicationShortcutIcon? {
        if self == .custom {
            fatalError("`Custom` type need to be used with `toApplicationShortcutIcon:imageName`")
        }
        let icon = UIApplicationShortcutIcon.IconType(rawValue: rawValue) ?? UIApplicationShortcutIcon.IconType.confirmation
        return UIApplicationShortcutIcon(type: icon)
    }

    /// Convert current instance to UIApplicationShortcutItem
    ///
    /// - Parameter imageName: some image for shortcut
    /// - Returns: UIApplicationShortcutItem instance
    func toApplicationShortcutIcon(_ imageName: String) -> UIApplicationShortcutIcon? {
        UIApplicationShortcutIcon(templateImageName: imageName)
    }
}
