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

    typealias Input = SignInModuleInput
    typealias View = SignInViewController

    required init() {
    }

    static func instantiate() -> SignInViewController {
		SignInModuleAssembly().obtainViewController()
    }
}
