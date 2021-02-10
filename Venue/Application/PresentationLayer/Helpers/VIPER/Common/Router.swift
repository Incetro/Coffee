//
//  Router.swift
//  Venue
//
//  Created by incetro on 3/23/20.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - Router

class Router: RouterInput {

    // MARK: - Properties

    /// Transition handler instance
    private(set) unowned var transitionHandler: TransitionHandler

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter transitionHandler: transition handler instance
    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
}
