//
//  AppDelegateProxy.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//
// swiftlint:disable implicitly_unwrapped_optional

import UIKit

// MARK: - AppDelegateProxy

@UIApplicationMain
final class AppDelegateProxy: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    /// All available application handlers
    private let handlers: [AppDelegateHandler] = {
        VenueDelegatesCollector().delegates()
    }()

    // MARK: - NSObject

    override func responds(to aSelector: Selector!) -> Bool {
        if shouldForwardSelector(aSelector: aSelector) {
            return handlers.contains { $0.responds(to: aSelector) }
        }
        return NSObject.instancesRespond(to: aSelector)
    }

    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        handlers.first { $0.responds(to: aSelector) }
    }

    // MARK: - Private

    /// Check if the given selector should be forwarded to some application handler
    private func shouldForwardSelector(aSelector: Selector) -> Bool {
        isSelector(
            aSelector: aSelector,
            fromProtocol: UIApplicationDelegate.self
        ) &&
        !isSelector(
            aSelector: aSelector,
            fromProtocol: NSObjectProtocol.self
        )
    }

    /// Check if the given selector is method of the given protocol
    private func isSelector(aSelector: Selector, fromProtocol aProtocol: Protocol) -> Bool {

        let requiredMethod = [false, false, true, true]
        let instanceMethod = [false, true, false, true]

        for callVariant in 0..<4 {
            let methodDescription = protocol_getMethodDescription(aProtocol, aSelector, requiredMethod[callVariant], instanceMethod[callVariant])
            if methodDescription.types != nil && methodDescription.name != nil {
                return true
            }
        }

        return false
    }
}
