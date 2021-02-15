//
//  AuthServiceImplementation.swift
//  TheRun
//
//  Created by incetro on 3/15/20.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - AuthServiceImplementation

final class AuthServiceImplementation: Service {

    // MARK: - Properties

    /// Notifier instance
    private let notifier: Notifier

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - sessionStorage: SessionStorage instance
    ///   - notifier: Notifier instance
    init(
        notifier: Notifier
    ) {
        self.notifier = notifier
    }
}

// MARK: - AuthService

extension AuthServiceImplementation: AuthService {

    func check(login: String) -> ServiceCall<Bool> {
        createCall { () -> Result<Bool, Error> in
            sleep(10)
            return .success(false)
        }
    }

    func refreshAccessToken() -> ServiceCall<Void> {
        createCall { () -> Result<Void, Error> in
            .success(())
        }
    }

    func requestCode(withLogin login: String) -> ServiceCall<Void> {
        createCall { () -> Result<Void, Error> in
            .success(())
        }
    }

    func signIn(withPassword password: String, login: String) -> ServiceCall<Void> {
        createCall { () -> Result<Void, Error> in
            .success(())
        }
    }

    func signUp(_ object: SignUpPlainObject, withCode code: String) -> ServiceCall<Void> {
        createCall { () -> Result<Void, Error> in
            .success(())
        }
    }

    func change(password: String) -> ServiceCall<Void> {
        createCall { () -> Result<Void, Error> in
            .success(())
        }
    }
}
