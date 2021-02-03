//
//  Module.swift
//  Workzilla
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2017 Incetro. All rights reserved.
//

import UIKit

// MARK: - Module

protocol Module {

    /// Current module's view type
    associatedtype View

    /// ModuleInput type
    associatedtype Input

    /// Instantiate module as a view
    ///
    /// - Returns: new module instance
    static func instantiate() -> View
}
