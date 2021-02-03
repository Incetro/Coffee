//
//  SegueTransitionPromise.swift
//  TransitionHandler
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 incetro. All rights reserved.
//

import UIKit

// MARK: - SegueTransitionPromise

final class SegueTransitionPromise<T>: TransitionPromise<T> {

    weak var transitioningDelegate: UIViewControllerTransitioningDelegate?

    let identifier: String

    init(identifier: String, source: UIViewController, for type: T.Type) {
        self.identifier = identifier
        super.init(source: source, destination: nil, for: type)
    }

    func set(transitioningDelegate: UIViewControllerTransitioningDelegate) -> SegueTransitionPromise<T> {
        self.transitioningDelegate = transitioningDelegate
        return self
    }

    // swiftlint:disable cyclomatic_complexity
    func then(asyncIn queue: DispatchQueue?, _ block: @escaping TransitionConfigureBlock<T>) throws {

        let then = {
            self.source.performSegue(withIdentifier: self.identifier, sender: nil) { segue in
                if segue is EmbedSegue {
                    guard self.source is EmbedSegueViewController else {
                        throw TransitionHandlerError.custom("Source must conform to `EmbedSegueViewController`")
                    }
                }

                var destination = segue.destination
                destination.transitioningDelegate = self.transitioningDelegate

                if let navigationController = destination as? UINavigationController {
                    destination = navigationController.topViewController ?? segue.destination
                } else if let tabBarController = segue.destination as? UITabBarController {
                    guard let viewControllers = tabBarController.viewControllers else {
                        throw TransitionHandlerError.custom("UITabBarController's children can't be nil")
                    }
                    if tabBarController.moduleInput is T {
                        destination = tabBarController
                    } else {
                        for controller in viewControllers {
                            if controller.moduleInput is T || controller is T {
                                destination = controller
                                break
                            }
                        }
                    }
                }

                if let moduleInput = destination.moduleInput as? T {
                    block(moduleInput)
                } else if let moduleInput = destination as? T {
                    block(moduleInput)
                } else {
                    throw TransitionHandlerError.cast(from: String(describing: destination.self), to: "\(T.self)")
                }
            }
        }

        if let queue = queue {
            queue.async {
                then()
            }
        } else {
            then()
        }
    }

    override func then(_ block: @escaping TransitionConfigureBlock<T>) {
        do {
            try then(asyncIn: .main, block)
        } catch {
            log.error(error)
        }
    }
}
