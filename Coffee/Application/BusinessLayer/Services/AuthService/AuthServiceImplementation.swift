//
//  AuthServiceImplementation.swift
//  TheRun
//
//  Created by incetro on 3/15/20.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

// MARK: - AuthServiceImplementation

final class AuthServiceImplementation {

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

    func check(phone: String) -> ServiceCall<Bool> {
        createCall { () -> Result<Bool, Error> in
            return .success(true)
        }
    }

    func refreshAccessToken() -> ServiceCall<Void> {
        createCall { () -> Result<Bool, Error> in
            return .success(())
        }
    }

    func requestCode(withPhone phone: String) -> ServiceCall<Void> {
        createCall { () -> Result<Bool, Error> in
            return .success(())
        }
    }

    func signIn(withPassword password: String, phone: String) -> ServiceCall<Void> {
        createCall { () -> Result<Bool, Error> in
            return .success(())
        }
    }

    func signUp(_ object: SignUpPlainObject, withCode code: String) -> ServiceCall<Void> {
        createCall { () -> Result<Bool, Error> in
            return .success(())
        }
    }

    func change(password: String) -> ServiceCall<Void> {
        createCall { () -> Result<Bool, Error> in
            return .success(())
        }
    }
}
