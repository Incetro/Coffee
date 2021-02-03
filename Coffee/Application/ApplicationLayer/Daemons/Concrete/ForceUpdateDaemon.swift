//
//  ForceUpdateDaemon.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 incetro. All rights reserved.
//

import Message

// MARK: - ForceUpdateDaemon

final class ForceUpdateDaemon {

    // MARK: - Properties

    /// Bundle instance
    private let bundle: Bundle

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter bundle: Bundle instance
    init(bundle: Bundle) {
        self.bundle = bundle
    }
}

// MARK: - Daemon

extension ForceUpdateDaemon: Daemon {

    func start() {
    }

    func stop() {
    }
}
