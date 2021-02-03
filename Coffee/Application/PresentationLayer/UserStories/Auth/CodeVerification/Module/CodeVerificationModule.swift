//
//  CodeVerificationModule.swift
//  TheRun
//
//  Created by incetro on 12/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//
// swiftlint:disable nesting

import UIKit

// MARK: - CodeVerificationModule

final class CodeVerificationModule: AdvancedModule {

    typealias Input = CodeVerificationModuleInput
    typealias View = CodeVerificationViewController

    enum Data {

        // MARK: - PasswordType

        enum PasswordType {
            case reset
            case signIn
            case signUp
            case change
        }

        // MARK: - Cases

        case signIn(String)
        case signUp(SignUpPlainObject)
        case password(PasswordType)
        case sms(phone: String)

        // MARK: - Properties

        var phone: String? {
            switch self {
            case .signIn(let phone):
                return phone
            case .signUp(let signUp):
                return signUp.phone
            default:
                return nil
            }
        }

        var description: String {
            switch self {
            case .signIn:
                return L10n.CodeVerification.Description.password
            case .signUp:
                return L10n.CodeVerification.Description.signUpPassword
            case .password(let type):
                switch type {
                case .change, .reset:
                    return L10n.CodeVerification.Description.newPassword
                case .signIn:
                    return L10n.CodeVerification.Description.password
                case .signUp:
                    return L10n.CodeVerification.Description.signUpPassword
                }
            case .sms(phone: let phone):
                return L10n.CodeVerification.Description.sms(phone)
            }
        }

        var codeLength: Int {
            switch self {
            case .signIn, .signUp, .password:
                return 6
            case .sms:
                return 4
            }
        }
    }

    required init() {
    }

    static func instantiate(withData data: Data) -> CodeVerificationViewController {
        CodeVerificationModuleAssembly().obtainViewController(withData: data)
    }
}
