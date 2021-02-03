//
//  LaunchRouter.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - LaunchRouter

protocol LaunchRouter {

    /// Open some screen with the given data
    ///
    /// - Parameter data: Data for the screen initialization
    func openScreen(withData data: Any?)
}
