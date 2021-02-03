//
//  TransitionHandler.swift
//  TransitionHandler
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 incetro. All rights reserved.
//

import Foundation

// MARK: - TransitionHandlerError

enum TransitionHandlerError: LocalizedError {

    case custom(String)
    case nilController(String)
    case cast(from: String, to: String)
}
