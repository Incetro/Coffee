//
//  Service.swift
//  TheRun
//
//  Created by incetro on 3/21/20.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - Service

class Service {

    /// Background working queue
    let operationQueue: OperationQueue

    /// Main queue for callbacks
    let completionQueue: OperationQueue

    /// Default initializer
    /// - Parameters:
    ///   - operationQueue: background working queue
    ///   - completionQueue: main queue for callbacks
    init(
        operationQueue: OperationQueue = OperationQueue(),
        completionQueue: OperationQueue = OperationQueue.main
    ) {
        self.operationQueue = operationQueue
        self.completionQueue = completionQueue
    }

    /// Assemble a sync/async call object.
    /// - Parameter main: main execution method
    func createCall<Payload>(main: @escaping ServiceCall<Payload>.Main) -> ServiceCall<Payload> {
        ServiceCall(
            operationQueue: operationQueue,
            callbackQueue: completionQueue,
            main: main
        )
    }
}
