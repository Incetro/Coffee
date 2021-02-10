//
//  LaunchersAssembly.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Swinject

// MARK: - LaunchersAssembly

final class LaunchersAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(QuickActionLauncher.self) { _ in
            let routers = [VenueQuickAction: LaunchRouter]()
            return QuickActionLauncher(routers: routers)
        }

        container.register([Launcher].self) { resolver in
            var launchers: [Launcher] = []
            launchers.append(resolver.resolve(QuickActionLauncher.self).unwrap())
            return launchers
        }
    }
}
