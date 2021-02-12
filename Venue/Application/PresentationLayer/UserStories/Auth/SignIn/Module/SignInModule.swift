//
//  SignInModule.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - SignInModule

final class SignInModule: Module {

    // MARK: - Aliases

    typealias Input = SignInModuleInput
    typealias View = SignInViewController

    // MARK: - Initializers

    required init() {
    }

    // MARK: - Module

    static func instantiate() -> SignInViewController {
        SignInModuleAssembly().obtainViewController()
    }
}
