//
//  SignInViewOutput.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SignInViewOutput

protocol SignInViewOutput {

    /// View is ready
    func didTriggerViewReadyEvent()

    /// Phone was entered and sign in button was tapped
    /// - Parameters:
    ///   - phone: entered phone number
    func didTapSignInButton(phone: String)
}
