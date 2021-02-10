//
//  DaemonsAssembly.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//
// swiftlint:disable unused_closure_parameter

import Swinject

// MARK: - DaemonsAssembly

final class DaemonsAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(QuickActionDaemon.self) { resolver in
            QuickActionDaemon()
        }

        container.register(ForceUpdateDaemon.self) { resolver in
            let bundle = resolver.resolve(Bundle.self).unwrap()
            return ForceUpdateDaemon(bundle: bundle)
        }

        container.register([Daemon].self) { resolver in
            [
                resolver.resolve(QuickActionDaemon.self).unwrap(),
                resolver.resolve(ForceUpdateDaemon.self).unwrap()
            ]
        }

        container.register(LogoutDaemon.self) { resolver in
            let cacheCleaner = resolver.resolve(CacheCleaner.self).unwrap()
            let window = resolver.resolve(UIWindow.self).unwrap()
            let navigationontrollerFactory = resolver.resolve(NavigationControllerFactory.self).unwrap()
            return LogoutDaemon(
                cacheCleaner: cacheCleaner,
                window: window,
                navigationControllerFactory: navigationontrollerFactory
            )
        }

        container.register(ReachabilityDaemon.self) { resolver in
            ReachabilityDaemon()
        }
    }
}
