//
//  BusinessComponentsAssembly.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

// MARK: - BusinessComponentsAssembly

final class BusinessComponentsAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.autoregister(Localizer.self, initializer: LocalizerImplementation.init).inObjectScope(.container)

        container.autoregister(AuthService.self, initializer: AuthServiceImplementation.init).inObjectScope(.container)
    }
}
