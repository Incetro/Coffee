//
//  SignInAssembly.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit
import Swinject

// MARK: - SignInModuleAssembly

final class SignInModuleAssembly: CollectableAssembly {

    // MARK: - Initializers

    required init() {
    }

    // MARK: - Useful

    func obtainViewController() -> SignInViewController {
        container.resolve(SignInViewController.self).unwrap()
    }

    // MARK: - Assembly

    func assemble(inContainer container: Container) {

        container.register(SignInViewController.self) { resolver in
            let controller = SignInViewController()
            controller.output = resolver.resolve(SignInViewOutput.self, argument: controller as SignInViewInput)
            return controller
        }

        container.register(SignInRouterInput.self) { (resolver, transitionHandler: TransitionHandler) in
            let navigationControllerFactory = resolver.resolve(NavigationControllerFactory.self).unwrap()
            let router = SignInRouter(
                navigationControllerFactory: navigationControllerFactory,
                transitionHandler: transitionHandler
            )
            return router
        }

        container.register(SignInViewOutput.self) { (_, view: SignInViewInput) in
            let presenter = SignInPresenter()
            presenter.view = view
            return presenter
        }.initCompleted { resolver, viewOutput in
            if let presenter = viewOutput as? SignInPresenter {
                presenter.interactor = resolver.resolve(SignInInteractorInput.self, argument: presenter as SignInInteractorOutput)
                if let transitionHandler = presenter.view as? TransitionHandler {
                    presenter.router = resolver.resolve(SignInRouterInput.self, argument: transitionHandler)
                }
            }
        }

        container.register(SignInInteractorInput.self) { (resolver, interactorOutput: SignInInteractorOutput) in
            let authService = resolver.resolve(AuthService.self).unwrap()
            let interactor = SignInInteractor(authService: authService)
            interactor.output = interactorOutput
            return interactor
        }
    }
}
