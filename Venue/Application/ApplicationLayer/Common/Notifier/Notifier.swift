//
//  Notifier.swift
//  Venue
//
//  Created by incetro on 15/12/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - Notifier

final class Notifier {

    /// NotificationHandler with parameter alias
    typealias NotificationHandler<T> = (T) -> Void

    // MARK: - Properties

    private var complexObservers: [NotificationType: ObserverList<NotificationHandler<Any>>] = [:]
    private var plainObservers: [NotificationType: ObserverList<VoidClosure>] = [:]

    // MARK: - Useful

    func add<T>(observer: AnyObject, on notification: NotificationType, withHandler handler: @escaping NotificationHandler<T>) {
        if complexObservers[notification] == nil {
            complexObservers[notification] = ObserverList<NotificationHandler<Any>>()
        }
        let observers = self.complexObservers[notification].unwrap()
        observers.addObserver(disposable: observer) { data in
            if let data = data as? T {
                handler(data)
            }
        }
    }

    func add(observer: AnyObject, on notification: NotificationType, withHandler handler: @escaping VoidClosure) {
        if plainObservers[notification] == nil {
            plainObservers[notification] = ObserverList<VoidClosure>()
        }
        let observers = self.plainObservers[notification].unwrap()
        observers.addObserver(disposable: observer, observer: handler)
    }

    func raise<T>(_ notification: NotificationType, withData data: T) {
        guard let observers = complexObservers[notification] else {
            return
        }
        observers.forEach { handler in
            handler(data)
        }
    }

    func raise(_ notification: NotificationType) {
        guard let observers = plainObservers[notification] else {
            return
        }
        observers.forEach { handler in
            handler()
        }
    }

    func remove(observer: AnyObject, for notification: NotificationType) {
        complexObservers[notification]?.removeObserver(disposable: observer)
    }
}
