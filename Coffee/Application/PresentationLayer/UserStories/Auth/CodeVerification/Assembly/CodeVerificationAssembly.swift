//
//  CodeVerificationAssembly.swift
//  TheRun
//
//  Created by incetro on 12/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit
import Swinject

// MARK: - CodeVerificationModuleAssembly

final class CodeVerificationModuleAssembly: CollectableAssembly {

    // MARK: - Initializers

    required init() {
    }

    // MARK: - Useful

    func obtainViewController(withData data: CodeVerificationModule.Data) -> CodeVerificationViewController {
        container.resolve(CodeVerificationViewController.self, argument: data).unwrap()
    }

    // MARK: - Assembly

    func assemble(inContainer container: Container) {
    }
}
