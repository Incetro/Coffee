//
//  CoreComponentsAssembly.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Swinject

// MARK: - CoreComponentsAssembly

final class CoreComponentsAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(Mailer.self) { resolver in
            let application = resolver.resolve(UIApplication.self).unwrap()
            return Mailer(application: application)
        }
    }
}
