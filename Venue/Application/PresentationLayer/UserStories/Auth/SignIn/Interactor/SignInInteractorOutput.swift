//
//  SignInInteractorOutput.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

// MARK: - SignInInteractorOutput

protocol SignInInteractorOutput: class, InteractorOutput {

    func signInAllowed(withLogin login: String)
    func signUpRequired(withLogin login: String)
    func mailIncorrect(_ login: String)
}
