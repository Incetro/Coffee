//
//  NotifierHolder.swift
//  Venue
//
//  Created by incetro on 15/12/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - NotifierHolder

protocol NotifierHolder {

    /// Global notifier instance
    var notifier: Notifier { get }
}

extension NotifierHolder {

    var notifier: Notifier {
        AssembliesHolder.container.resolve(Notifier.self).unwrap()
    }
}
