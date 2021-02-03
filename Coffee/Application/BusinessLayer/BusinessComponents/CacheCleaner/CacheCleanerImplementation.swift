//
//  CacheCleanerImplementation.swift
//  Coffee
//
//  Created by incetro on 23/12/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import RealmSwift
import Kingfisher

// MARK: - CacheCleanerImplementation

final class CacheCleanerImplementation {

    // MARK: - Properties

    /// Bundle instance
    private let bundle: Bundle

    /// UserDefaults instance
    private let defaults: UserDefaults

    /// Realm instance
    private let realm: Realm

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - bundle: Bundle instance
    ///   - defaults: UserDefaults instance
    ///   - realm: Realm instance
    init(bundle: Bundle, defaults: UserDefaults, realm: Realm) {
        self.bundle = bundle
        self.defaults = defaults
        self.realm = realm
    }
}

// MARK: - CacheCleaner

extension CacheCleanerImplementation: CacheCleaner {

    func clean() {
        do {
            for item in Constants.UserDefaultsKeys.allCases where item.shouldRemoveOnCleaning {
                defaults.removeValue(forKey: item)
            }
            defaults.synchronize()
            try realm.write {
                realm.deleteAll()
            }
            KingfisherManager.shared.cache.clearDiskCache()
            KingfisherManager.shared.cache.clearMemoryCache()
        } catch {
            log.error(error)
        }
    }
}
