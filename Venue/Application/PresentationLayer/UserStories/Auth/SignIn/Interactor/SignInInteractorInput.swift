//
//  SignInInteractorInput.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SignInInteractorInput

protocol SignInInteractorInput {

    /// Checking for login via backend request
    /// - Parameter login: contains String value of login
    func checkLogin(_ login: String)
}
