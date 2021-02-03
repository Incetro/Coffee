//
//  SignInRouter.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - SignInRouter

final class SignInRouter: Router {

    // MARK: - Properties

    /// NavigationControllerFactory instance
    private let navigationControllerFactory: NavigationControllerFactory

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - navigationControllerFactory: NavigationControllerFactory instance
    ///   - transitionHandler: TransitionHandler instance
    init(
        navigationControllerFactory: NavigationControllerFactory,
        transitionHandler: TransitionHandler
    ) {
        self.navigationControllerFactory = navigationControllerFactory
        super.init(transitionHandler: transitionHandler)
    }
}
