//
//  SignInInteractorOutput.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

// MARK: - SignInInteractorOutput

protocol SignInInteractorOutput: class, InteractorOutput {

    /// Login check was successful and necessary to sign in
    /// - Parameter login: contains String value of login
    func signInAllowed(withLogin login: String)

    /// Login check was successful and necessary to sign up
    /// - Parameter login: contains String value of login
    func signUpRequired(withLogin login: String)

    /// Login check was failed
    /// - Parameter login: contains String value of login
    func loginIncorrect(_ login: String)
}
