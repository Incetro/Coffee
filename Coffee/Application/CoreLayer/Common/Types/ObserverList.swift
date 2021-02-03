//
//  ObserverList.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - ObserverBox

private class ObserverBox<T>: Hashable {

    // MARK: - Aliases

    typealias Observer = T

    // MARK: - Properties

    private(set) weak var disposable: AnyObject?
    private let objectIdentifier: ObjectIdentifier

    var observers = [Observer]()

    // MARK: - Initializers

    init(disposable: AnyObject) {
        self.disposable = disposable
        objectIdentifier = ObjectIdentifier(disposable)
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(objectIdentifier.hashValue)
    }

    static func == (left: ObserverBox, right: ObserverBox) -> Bool {
        left.objectIdentifier == right.objectIdentifier
    }
}

// MARK: - ObserverList

final class ObserverList<T> {

    // MARK: - Aliases

    typealias Observer = T

    // MARK: - Properties

    private var observers = Set<ObserverBox<Observer>>()

    var isEmpty: Bool {
        observers.isEmpty
    }

    // MARK: - Initializers

    init() {}

    // MARK: - Useful

    func addObserverIfNotContains(disposable: AnyObject, observer: Observer) {
        let box = ObserverBox<Observer>(disposable: disposable)
        guard !observers.contains(box) else {
            return
        }
        addObserver(disposable: disposable, observer: observer)
    }

    func addObserver(disposable: AnyObject, observer: Observer) {
        let box = ObserverBox<Observer>(disposable: disposable)
        let (_, memberAfterInsert) = observers.insert(box)
        if !memberAfterInsert.observers.contains(where: { ObjectIdentifier($0 as AnyObject) == ObjectIdentifier(observer as AnyObject) }) {
            memberAfterInsert.observers.append(observer)
        }
    }

    func removeObserver(disposable: AnyObject) {
        observers.remove(ObserverBox<Observer>(disposable: disposable))
    }

    func removeObserver(observer: Observer) {
        for obs in self.observers {
            if let index = obs.observers.firstIndex(where: {
                ObjectIdentifier($0 as AnyObject) == ObjectIdentifier(observer as AnyObject)
            }) {
                obs.observers.remove(at: index)
            }
        }
    }

    func forEach(_ closure: (T) -> Void) {
        let newObservers = observers.filter { box in
            if box.disposable != nil {
                box.observers.forEach(closure)
                return true
            } else {
                return false
            }
        }
        if newObservers.count != observers.count {
            observers = Set(newObservers)
        }
    }

    func forEach(_ closure: (AnyObject, T) -> Void) {
        let newObservers = observers.filter { box in
            if let disposable = box.disposable {
                box.observers.forEach {
                    closure(disposable, $0)
                }
                return true
            } else {
                return false
            }
        }
        if newObservers.count != observers.count {
            observers = Set(newObservers)
        }
    }
}
