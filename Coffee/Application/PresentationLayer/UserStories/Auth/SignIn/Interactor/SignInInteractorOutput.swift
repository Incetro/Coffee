//
//  SignInInteractorOutput.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

// MARK: - SignInInteractorOutput

protocol SignInInteractorOutput: class, InteractorOutput {

    func signInAllowed(withMail mail: String)
    func signUpRequired(withMail mail: String)
    func mailIncorrect(_ mail: String)
}
