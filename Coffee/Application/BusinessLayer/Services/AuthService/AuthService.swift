//
//  AuthService.swift
//  TheRun
//
//  Created by incetro on 3/15/20.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SignUpPlainObject

struct SignUpPlainObject {
    let username: String
    let name: String
    let phone: String
    var password: String?
}

// MARK: - AuthService

protocol AuthService {

    /// Checks if the given phone already registered in the app
    /// - Parameter phone: some phone
    func check(mail: String) -> ServiceCall<Bool>

    /// Refresh current user token
    func refreshAccessToken() -> ServiceCall<Void>

    /// Send an auth code to the given number
    /// - Parameter phone: some phone
    func requestCode(withMail mail: String) -> ServiceCall<Void>

    /// Sign in user
    /// - Parameters:
    ///   - password: user password
    ///   - phone: user phone
    func signIn(withPassword password: String, mail: String) -> ServiceCall<Void>

    /// User sign up
    /// - Parameters:
    ///   - object: sign up data
    ///   - code: verification code
    func signUp(_ object: SignUpPlainObject, withCode code: String) -> ServiceCall<Void>

    /// Change user password
    /// - Parameters:
    ///   - password: new password
    func change(password: String) -> ServiceCall<Void>
}
