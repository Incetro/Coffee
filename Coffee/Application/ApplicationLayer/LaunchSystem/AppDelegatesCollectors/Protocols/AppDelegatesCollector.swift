//
//  AppDelegatesCollector.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - AppDelegatesCollector

protocol AppDelegatesCollector {

    /// Collect all available app delegates into array
    ///
    /// - Returns: all available app delegates
    func delegates() -> [AppDelegateHandler]
}
