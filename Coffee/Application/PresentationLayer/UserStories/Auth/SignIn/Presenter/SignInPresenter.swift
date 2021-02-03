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

    func didTapSignInButton(phone: String) {
        view?.startIndication()
        interactor?.checkPhone(phone)
    }
}

// MARK: - SignInInteractorOutput

extension SignInPresenter: SignInInteractorOutput {

    func processErrorMessage(_ errorMessage: String) {
        view?.stopIndication()
        view?.showErrorMessage(errorMessage)
    }

    func signInAllowed(withPhone phone: String) {
        view?.stopIndication()
    }

    func signUpRequired(withPhone phone: String) {
        view?.stopIndication()
        router?.openSignUp(phone: phone)
    }

    func phoneNumberIncorrect(_ phone: String) {
        view?.stopIndication()
        view?.showErrorMessage(L10n.Alert.SignIn.InvalidPhoneNumber.message)
    }
}

// MARK: - SignInModuleInput

extension SignInPresenter: SignInModuleInput {
}
