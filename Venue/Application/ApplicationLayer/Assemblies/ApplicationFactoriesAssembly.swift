//
//  ApplicationFactoriesAssembly.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//
// swiftlint:disable unused_closure_parameter

import Swinject

// MARK: - ApplicationFactoriesAssembly

final class ApplicationFactoriesAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(QuickActionUserActivityFactory.self) { resolver in
            QuickActionUserActivityFactoryImplementation()
        }

        container.register(NavigationControllerFactory.self) { resolver in
            NavControllerFactoryImplementation()
        }
    }
}
