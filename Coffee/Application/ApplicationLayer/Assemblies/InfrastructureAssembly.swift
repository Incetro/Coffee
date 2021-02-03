//
//  InfrastructureAssembly.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//
// swiftlint:disable unused_closure_parameter

import Swinject

// MARK: - InfrastructureAssembly

final class InfrastructureAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(UserDefaults.self) { resolver in
            .standard
        }

        container.register(FileManager.self) { resolver in
            .default
        }

        container.register(UIWindow.self) { resolver in
            UIWindow(frame: UIScreen.main.bounds)
        }.inObjectScope(.container)

        container.register(HTTPCookieStorage.self) { resolver in
            .shared
        }

        container.register(URLSession.self) { resolver in
            .shared
        }

        container.register(UIApplication.self) { resolver in
            let application = UIApplication.shared
            return application
        }

        container.register(Bundle.self) { resolver in
            .main
        }

        container.register(NotificationCenter.self) { resolver in
            .default
        }

        container.register(Container.self) { resolver in
            AssembliesHolder.container
        }

        container.register(Notifier.self) { resolver in
            Notifier()
        }.inObjectScope(.container)
    }
}
