//
//  UserDefaults.swift
//  Venue
//
//  Created by incetro on 03/12/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - UserDefaults

extension UserDefaults {

    func setValue(_ value: Any, forKey key: Constants.UserDefaultsKeys) {
        setValue(value, forKey: key.rawValue)
    }

    func removeValue(forKey key: Constants.UserDefaultsKeys) {
        removeObject(forKey: key.rawValue)
    }

    func value(forKey key: Constants.UserDefaultsKeys) -> Any? {
        value(forKey: key.rawValue)
    }
}
