//
//  ConfiguratorsAssembly.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//
// swiftlint:disable unused_closure_parameter

import Swinject

// MARK: - ConfiguratorsAssembly

final class ConfiguratorsAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(ApplicationConfigurator.self) { resolver in
            let application = resolver.resolve(UIApplication.self).unwrap()
            let localizer = resolver.resolve(Localizer.self).unwrap()
            return ApplicationConfigurator(application: application, localizer: localizer)
        }

        container.register(ExternalDependenciesConfigurator.self) { resolver in
            ExternalDependenciesConfigurator(configuration: Configuration())
        }

        container.register(QuickActionsConfigurator.self) { resolver in
            let application = resolver.resolve(UIApplication.self).unwrap()
            let bundle = resolver.resolve(Bundle.self).unwrap()
            return QuickActionsConfigurator(application: application, bundle: bundle)
        }

        container.register([Configurator].self) { resolver in
            var configurators: [Configurator] = []
            configurators.append(resolver.resolve(ExternalDependenciesConfigurator.self).unwrap())
            configurators.append(resolver.resolve(ApplicationConfigurator.self).unwrap())
            configurators.append(resolver.resolve(QuickActionsConfigurator.self).unwrap())
            return configurators
        }
    }
}
