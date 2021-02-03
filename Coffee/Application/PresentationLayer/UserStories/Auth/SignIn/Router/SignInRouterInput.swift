//
//  SignInRouterInput.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SignInRouterInput

protocol SignInRouterInput: RouterInput {

    /// Open CodeVerification module
    /// - Parameter data: data for verifying
    func openCodeVerification(_ data: CodeVerificationModule.Data)
}
