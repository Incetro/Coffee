//
//  SignInPresenter.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SignInPresenter

final class SignInPresenter {

    // MARK: - Properties

    /// View instance
    weak var view: SignInViewInput?

    /// Interactor instance
    var interactor: SignInInteractorInput?

    /// Router instance
    var router: SignInRouterInput?
}

// MARK: - SignInViewOutput

extension SignInPresenter: SignInViewOutput {

    func didTriggerViewReadyEvent() {
        view?.setupInitialState()
    }

    func didTapSignInButton(mail: String) {
        view?.startIndication()
//        interactor?.checkMail(mail)
    }
}

// MARK: - SignInInteractorOutput

extension SignInPresenter: SignInInteractorOutput {

    func processErrorMessage(_ errorMessage: String) {
        view?.stopIndication()
        view?.showErrorMessage(errorMessage)
    }

    func signInAllowed(withMail mail: String) {
        view?.stopIndication()
    }

    func signUpRequired(withMail mail: String) {
        view?.stopIndication()
    }

    func mailIncorrect(_ mail: String) {
        view?.stopIndication()
        view?.showErrorMessage(L10n.Alert.SignIn.InvalidPhoneNumber.message)
    }
}

// MARK: - SignInModuleInput

extension SignInPresenter: SignInModuleInput {
}
