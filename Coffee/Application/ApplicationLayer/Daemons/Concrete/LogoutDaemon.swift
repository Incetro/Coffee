//
//  LogoutDaemon.swift
//  Coffee
//
//  Created by incetro on 23/12/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - LogoutDaemon

final class LogoutDaemon: NotifierHolder {

    // MARK: - Properties

    /// CacheCleaner instance
    private let cacheCleaner: CacheCleaner

    /// Current app window
    private let window: UIWindow

    /// NavigationControllerFactory instance
    private let navigationControllerFactory: NavigationControllerFactory

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - cacheCleaner: CacheCleaner instance
    ///   - navigationControllerFactory: current app window
    ///   - window: NavigationControllerFactory instance
    init(
        cacheCleaner: CacheCleaner,
        window: UIWindow,
        navigationControllerFactory: NavigationControllerFactory
    ) {
        self.cacheCleaner = cacheCleaner
        self.window = window
        self.navigationControllerFactory = navigationControllerFactory
    }
}

// MARK: - Daemon

extension LogoutDaemon: Daemon {

    func start() {
        notifier.add(observer: self, on: .logout) { [weak self] (forceLogout: Bool) in
            let logoutBlock = { [weak self] in
                self?.cacheCleaner.clean()
            }
            if forceLogout {
                logoutBlock()
            } else {
                let view = UIApplication.shared.topViewController() as? ViewInput
                view?.startIndication()
            }
        }
    }

    func stop() {
        notifier.remove(observer: self, for: .logout)
    }
}
