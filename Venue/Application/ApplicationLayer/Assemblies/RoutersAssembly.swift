//
//  RoutersAssembly.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Swinject

// MARK: - RoutersAssembly

final class RoutersAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(CleanLaunchRouter.self) { resolver in
            let window = resolver.resolve(UIWindow.self).unwrap()
            let defaults = resolver.resolve(UserDefaults.self).unwrap()
            let navigationControllerFactory = resolver.resolve(NavigationControllerFactory.self).unwrap()
            return CleanLaunchRouter(
                window: window,
                defaults: defaults,
                navigationControllerFactory: navigationControllerFactory
            )
        }
    }
}
