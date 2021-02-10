//
//  BusinessComponentsAssembly.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Swinject

// MARK: - BusinessComponentsAssembly

final class BusinessComponentsAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(Localizer.self) { resolver in
            let defaults = resolver.resolve(UserDefaults.self).unwrap()
            return LocalizerImplementation(defaults: defaults)
        }.inObjectScope(.container)

        container.register(AuthService.self) { resolver in
            let notifier = resolver.resolve(Notifier.self).unwrap()
            return AuthServiceImplementation(notifier: notifier)
        }.inObjectScope(.container)
    }
}
