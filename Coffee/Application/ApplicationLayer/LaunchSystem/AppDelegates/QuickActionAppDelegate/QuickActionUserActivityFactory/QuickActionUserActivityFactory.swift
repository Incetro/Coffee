//
//  QuickActionUserActivityFactory.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - QuickActionUserActivityFactory

protocol QuickActionUserActivityFactory {

    /// Creates NSUserActivity from UIApplicationShortcutItem
    ///
    /// - Parameter shortcutItem: UIApplicationShortcutItem instance
    /// - Returns: NSUserActivity instance
    func userActivity(fromShortcutItem shortcutItem: UIApplicationShortcutItem) -> NSUserActivity
}
