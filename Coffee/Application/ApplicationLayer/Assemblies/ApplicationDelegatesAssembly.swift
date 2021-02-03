//
//  ApplicationDelegatesAssembly.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Swinject

// MARK: - ApplicationDelegatesAssembly

final class ApplicationDelegatesAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(QuickActionAppDelegate.self) { resolver in
            let factory = resolver.resolve(QuickActionUserActivityFactory.self).unwrap()
            let launchers = resolver.resolve([Launcher].self).unwrap()
            return QuickActionAppDelegate(activityFactory: factory, launchers: launchers)
        }

        container.register(CleanLaunchAppDelegate.self) { resolver in
            let router = resolver.resolve(CleanLaunchRouter.self).unwrap()
            let defaults = resolver.resolve(UserDefaults.self).unwrap()
            let daemons = resolver.resolve([Daemon].self).unwrap()
            let configuratos = resolver.resolve([Configurator].self).unwrap()
            let activityFactory = resolver.resolve(QuickActionUserActivityFactory.self).unwrap()
            return CleanLaunchAppDelegate(
                defaults: defaults,
                cleanLaunchRouter: router,
                daemons: daemons,
                configurators: configuratos,
                activityFactory: activityFactory
            )
        }

        container.register([AppDelegateHandler].self) { resolver in
            var handlers: [AppDelegateHandler] = []
            handlers.append(resolver.resolve(QuickActionAppDelegate.self).unwrap())
            handlers.append(resolver.resolve(CleanLaunchAppDelegate.self).unwrap())
            return handlers
        }
    }
}
