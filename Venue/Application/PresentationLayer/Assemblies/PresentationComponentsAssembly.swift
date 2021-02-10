//
//  PresentationComponentsAssembly.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 incetro. All rights reserved.
//

import Swinject

// MARK: - PresentationComponentsAssembly

final class PresentationComponentsAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(Designer.self) { resolver in
            let window = resolver.resolve(UIWindow.self).unwrap()
            return DesignerImplementation(window: window)
        }.inObjectScope(.container)

        container.register(KeyboardObserver.self) { _ in
            KeyboardObserver()
        }
    }
}
