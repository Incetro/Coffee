//
//  CacheCleaner.swift
//  Coffee
//
//  Created by incetro on 23/12/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - CacheCleaner

protocol CacheCleaner {

    /// Clean all cached data
    /// (defaults, realm, disk sotrage, etc.)
    func clean()
}
