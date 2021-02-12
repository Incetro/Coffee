//
//  SignInInteractor.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SignInInteractor

final class SignInInteractor {

    // MARK: - Properties

    /// Presenter instance
    weak var output: SignInInteractorOutput?

    /// AuthService instance
    private let authService: AuthService

    // MARK: - Initializers

    init(authService: AuthService) {
        self.authService = authService
    }
}

// MARK: - SignInInteractorInput

extension SignInInteractor: SignInInteractorInput {

    func checkLogin(_ login: String) {
        authService
            .check(login: login)
            .async()
            .success { [weak self] exists in
                if exists {
                    self?.output?.signInAllowed(withLogin: login)
                } else {
                    self?.output?.signUpRequired(withLogin: login)
                }
            }
            .failure(output?.processError)
    }
}
