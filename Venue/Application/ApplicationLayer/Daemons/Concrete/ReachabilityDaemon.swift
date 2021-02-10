//
//  ReachabilityDaemon.swift
//  Venue
//
//  Created by incetro on 6/5/20.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - ReachabilityDaemon

final class ReachabilityDaemon {

    // MARK: - Properties

    /// Reachability instance
    private let reachability: Reachability

    // MARK: - Initializers

    init() {
        self.reachability = Reachability().unwrap()
    }
}

// MARK: - Daemon

extension ReachabilityDaemon: Daemon {

    func start() {
        reachability.whenReachable = { _ in }
        do {
            try reachability.startNotifier()
        } catch {
            log.error(error)
        }
    }

    func stop() {
        reachability.stopNotifier()
    }
}
