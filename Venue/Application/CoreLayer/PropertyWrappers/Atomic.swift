//
//  Atomic.swift
//  Venue
//
//  Created by incetro on 6/1/20.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - Atomic

@propertyWrapper
struct Atomic<Value> {

    // MARK: - Properties

    /// Syncing queue
    private let queue = DispatchQueue(label: "com.Venue.atomic")

    /// Stored value
    private var value: Value

    /// `value` accessor & mutator
    var wrappedValue: Value {
        get {
            queue.sync { value }
        }
        set {
            queue.sync { value = newValue }
        }
    }

    // MARK: - Initializers

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    // MARK: - Useful

    /// Mutate current value with the given closure
    /// - Parameter mutation: mutation block
    mutating func mutate(_ mutation: (inout Value) -> Void) {
        queue.sync { mutation(&value) }
    }
}
