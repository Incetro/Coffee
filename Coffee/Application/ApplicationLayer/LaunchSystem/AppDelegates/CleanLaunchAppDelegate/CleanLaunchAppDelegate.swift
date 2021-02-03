//
//  CleanLaunchAppDelegate.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit
import Message

// MARK: - CleanLaunchAppDelegate

final class CleanLaunchAppDelegate: AppDelegateHandler {

    // MARK: - Properties

    /// UserDefaults instance
    private let defaults: UserDefaults

    /// Router which can open initial screen
    private let cleanLaunchRouter: CleanLaunchRouter

    /// Application's daemons
    private let daemons: [Daemon]

    /// Application's configurators
    private let configurators: [Configurator]

    /// Factory for creating user actviities
    private let activityFactory: QuickActionUserActivityFactory

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameters:
    ///   - cleanLaunchRouter: Router which can open initial screen
    ///   - daemons: Application's daemons
    ///   - configurators: Application's configurators
    init(
        defaults: UserDefaults,
        cleanLaunchRouter: CleanLaunchRouter,
        daemons: [Daemon],
        configurators: [Configurator],
        activityFactory: QuickActionUserActivityFactory
    ) {
        self.defaults = defaults
        self.cleanLaunchRouter = cleanLaunchRouter
        self.daemons = daemons
        self.configurators = configurators
        self.activityFactory = activityFactory
    }

    required override init() {
        fatalError("init() has not been implemented")
    }

    // MARK: - AppDelegateHandler

    // swiftlint:disable line_length
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        configurators.forEach { configurator in
            configurator.configure()
        }

        daemons.forEach { daemon in
            daemon.start()
        }

        if let notification = launchOptions?[.remoteNotification] as? [AnyHashable: Any] {
            log.info("Application was opened from the push notification: \(notification)")
            cleanLaunchRouter.openInitialScreen(withRequest: .regular)
        } else if let shortcutItem = launchOptions?[.shortcutItem] as? UIApplicationShortcutItem {
            let activity = activityFactory.userActivity(fromShortcutItem: shortcutItem)
            cleanLaunchRouter.openInitialScreen(withRequest: .userActivity(activity))
        } else if
            let userActivityDictionary = launchOptions?[.userActivityDictionary] as? [AnyHashable: Any],
            let activity = userActivityDictionary.compactMapValues({ $0 as? NSUserActivity }).first?.value {
            cleanLaunchRouter.openInitialScreen(withRequest: .userActivity(activity))
        } else {
            cleanLaunchRouter.openInitialScreen(withRequest: .regular)
        }

        return true
    }
}
