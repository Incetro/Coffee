//
//  QuickActionLauncher.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - QuickActionLauncher

final class QuickActionLauncher {

    /// All available quick actions routers
    private let routers: [CoffeeQuickAction: LaunchRouter]

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter routers: all available quick actions routers
    init(routers: [CoffeeQuickAction: LaunchRouter]) {
        self.routers = routers
    }

    /// Create CoffeeQuickAction from NSUserActivity if it's possible
    ///
    /// - Parameter activity: some NSUserActivity
    /// - Returns: result CoffeeQuickAction
    private func qiuckActionFromUserActivity(_ activity: NSUserActivity) -> CoffeeQuickAction? {
        guard let type = activity.userInfo?[Constants.quickActionItemIdentifierKey] as? String else {
            return nil
        }
        return CoffeeQuickAction(rawValue: type)
    }
}

// MARK: - Launcher

extension QuickActionLauncher: Launcher {

    func canLaunch(withActivity activity: NSUserActivity) -> Bool {
        guard let quickAction = qiuckActionFromUserActivity(activity) else {
            return false
        }
        return routers.keys.contains(quickAction)
    }

    func launch(withActivity activity: NSUserActivity) {
        guard let quickAction = qiuckActionFromUserActivity(activity) else {
            log.error("Cannot create QuickAction as expected")
            return
        }
        if let router = routers[quickAction] {
            router.openScreen(withData: nil)
        }
    }
}
