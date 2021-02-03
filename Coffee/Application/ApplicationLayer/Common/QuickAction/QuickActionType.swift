//
//  QuickActionType.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - QuickActionType

protocol QuickActionType: RawRepresentable {
}

extension RawRepresentable where Self: QuickActionType {
    var value: String {
        self.rawValue as? String ?? ""
    }
}
