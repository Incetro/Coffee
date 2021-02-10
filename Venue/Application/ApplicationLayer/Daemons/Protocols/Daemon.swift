//
//  Daemon.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - Daemon

protocol Daemon {

    /// Start working
    func start()

    /// Stop working
    func stop()
}
