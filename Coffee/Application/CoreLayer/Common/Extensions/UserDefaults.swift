//
//  UserDefaults.swift
//  Coffee
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

    func cache<T: Codable>(value: T?, forKey key: Constants.UserDefaultsKeys) {
        do {
            if let value = value {
                let data = try JSONEncoder().encode(value)
                setValue(data, forKey: key.rawValue)
            } else {
            }
        } catch {
            log.error(error)
        }
    }

    func retrieve<T: Codable>(forKey key: Constants.UserDefaultsKeys) -> T? {
        guard let data = value(forKey: key.rawValue) as? Data else {
            return nil
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            log.error(error)
            fatalError(error.localizedDescription)
        }
    }

    func value(forKey key: Constants.UserDefaultsKeys) -> Any? {
        value(forKey: key.rawValue)
    }
}
