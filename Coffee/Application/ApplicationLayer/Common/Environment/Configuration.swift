//
//  Configuration.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - CoffeeConfiguration

protocol CoffeeConfiguration {
    var baseURL: String { get }
    var secretKey: String { get }
    var appCenterToken: String { get }
    var swiftyBeaverAppID: String { get }
    var swiftyBeaverAppSecret: String { get }
    var swiftyBeaverEncryptionKey: String { get }
    var isCodeSendingEnabled: Bool { get }
}

// MARK: - Configuration

struct Configuration {

    // MARK: - Keys

    private enum Keys {
        static let baseURL = "baseURL"
        static let secretKey = "secretKey"
        static let environment = "Environment"
        static let appCenterToken = "AppCenterToken"
        static let swiftyBeaverAppID = "SwiftyBeaverAppID"
        static let swiftyBeaverAppSecret = "SwiftyBeaverAppSecret"
        static let swiftyBeaverEncryptionKey = "SwiftyBeaverEncryptionKey"
        static let isCodeSendingEnabled = "isCodeSendingEnabled"
    }

    // MARK: - Environment

    enum Environment: String {
        case production = "Production"
        case development = "Development"
        case staging = "Staging"
    }

    // MARK: - Properties

    /// All stored config properties
    private let config: Parameters

    /// Environment type
    let environment: Environment

    // MARK: - Initializers

    /// Properties initializer
    ///
    /// - Parameters:
    ///   - config: all stored config properties
    ///   - environment: Environment type
    init(config: Parameters, environment: Environment) {
        self.config = config
        self.environment = environment
    }

    /// Defautlt initializer
    init() {
        let dictionary = Bundle.main.infoDictionary.unwrap()
        let environmentString = dictionary[Keys.environment.lowercased().capitalized].unwrap(as: String.self)
        let environment = Environment(rawValue: environmentString).unwrap()
        self.init(config: dictionary, environment: environment)
    }
}

// MARK: - CoffeeConfiguration

extension Configuration: CoffeeConfiguration {

    var baseURL: String {
        config[Keys.baseURL].unwrap(as: String.self)
    }

    var secretKey: String {
        config[Keys.secretKey].unwrap(as: String.self)
    }

    var appCenterToken: String {
        config[Keys.appCenterToken].unwrap(as: String.self)
    }

    var swiftyBeaverAppID: String {
        config[Keys.swiftyBeaverAppID].unwrap(as: String.self)
    }

    var swiftyBeaverAppSecret: String {
        config[Keys.swiftyBeaverAppSecret].unwrap(as: String.self)
    }

    var swiftyBeaverEncryptionKey: String {
        config[Keys.swiftyBeaverEncryptionKey].unwrap(as: String.self)
    }

    var isCodeSendingEnabled: Bool {
        NSString(string: config[Keys.isCodeSendingEnabled].unwrap(as: String.self)).boolValue
    }
}
