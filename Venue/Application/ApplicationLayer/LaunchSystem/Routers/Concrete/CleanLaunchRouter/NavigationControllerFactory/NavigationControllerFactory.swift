//
//  NavigationControllerFactory.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - NavigationControllerFactory

protocol NavigationControllerFactory {

    /// Create UINavigationController instance
    ///
    /// - Returns: UINavigationController instance
    func navigationController() -> UINavigationController

    /// Create UINavigationController instance with root view controller
    ///
    /// - Parameter rootViewController: root view controller
    /// - Returns: UINavigationController instance
    func navigationController(withRootViewController rootViewController: UIViewController) -> UINavigationController
}
