//
//  CleanLaunchRouter.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit
import Swinject

// MARK: - CleanLaunchRouter

final class CleanLaunchRouter {

    // MARK: - LaunchRequest

    enum LaunchRequest {
        case regular
        case userActivity(NSUserActivity)
    }

    // MARK: - Properties

    /// Global application's window
    private let window: UIWindow

    /// UserDefaults instance
    private let defaults: UserDefaults

    /// NavigationControllerFactory instance
    private let navigationControllerFactory: NavigationControllerFactory

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameters:
    ///   - window: global application's window
    ///   - sessionStorage: SessionStorage instance
    ///   - tabBarControllerFactory: TabBarControllerFactory instance
    init(
        window: UIWindow,
        defaults: UserDefaults,
        navigationControllerFactory: NavigationControllerFactory
    ) {
        self.window = window
        self.defaults = defaults
        self.navigationControllerFactory = navigationControllerFactory
    }

    // MARK: - Internal

    /// Initialize window and open initially screen
    func openInitialScreen(withRequest request: LaunchRequest) {
        let rootViewController = navigationControllerFactory
            .navigationController(withRootViewController: SignInModule.instantiate())
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
