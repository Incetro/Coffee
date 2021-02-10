//
//  QuickActionAppDelegate.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - QuickActionAppDelegate

final class QuickActionAppDelegate: AppDelegateHandler {

    // MARK: - Properties

    /// Factory for creating user actviities
    private let activityFactory: QuickActionUserActivityFactory

    /// Launchers for opening screens (as reactions on quick actions)
    private let launchers: [Launcher]

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameters:
    ///   - activityFactory: Factory for creating user actviities
    ///   - launchers: Launchers for opening screens (as reactions on quick actions)
    init(activityFactory: QuickActionUserActivityFactory, launchers: [Launcher]) {
        self.activityFactory = activityFactory
        self.launchers = launchers
        super.init()
    }

    required override init() {
        fatalError("init() has not been implemented")
    }

    // MARK: - AppDelegateHandler

    // swiftlint:disable line_length
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let activity = activityFactory.userActivity(fromShortcutItem: shortcutItem)
        if let launcher = launchers.first(where: { $0.canLaunch(withActivity: activity) }) {
            launcher.launch(withActivity: activity)
        }
    }
}
