//
//  CloseTransitionPromise.swift
//  TransitionHandler
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 incetro. All rights reserved.
//

import UIKit

typealias PromiseActionBlock = (() throws -> Void)

// MARK: - CloseTransitionPromise

final class CloseTransitionPromise {

    var isAnimated: Bool {
        animated
    }

    private unowned var source: UIViewController
    private var foundViewController: UIViewController?

    private var animated = true
    private var promise: PromiseActionBlock?

    init(source: UIViewController) {
        self.source = source
    }

    func promise(_ promise: @escaping PromiseActionBlock) {
        self.promise = promise
    }

    func animate(_ animate: Bool) -> CloseTransitionPromise {
        animated = animate
        return self
    }

    // swiftlint:disable cyclomatic_complexity
    func with(_ style: CloseTransitionStyle) -> CloseTransitionPromise {
        promise = nil
        promise = { [weak self] in
            guard let source = self?.source, let animated = self?.animated else {
                throw TransitionHandlerError.nilController("Source")
            }
            switch style {
            case .default:
                if source.presentingViewController != nil {
                    source.dismiss(animated: animated)
                } else {
                    source.removeFromParent()
                    source.view?.removeFromSuperview()
                }
            case .navigation(style: let navigationStyle):
                guard let navigationController = source.parent as? UINavigationController else {
                    throw TransitionHandlerError.nilController("Navigation")
                }
                switch navigationStyle {
                case .toRoot:
                    navigationController.popToRootViewController(animated: animated)
                case .simplePop:
                    if navigationController.children.count > 1 {
                        navigationController.popViewController(animated: animated)
                    } else {
                        throw TransitionHandlerError.custom("Can't make `simplePop` because UINavigationController children count < 2")
                    }
                case .conditionPop:
                    guard let found = self?.foundViewController else {
                        throw TransitionHandlerError.nilController("Condition")
                    }
                    navigationController.popToViewController(found, animated: animated)
                case .pop(to: let controller):
                    navigationController.popToViewController(controller, animated: animated)
                case .forcePop(to: let controller):
                    if navigationController.children.count > 1 {
                        var controllers = navigationController.children
                        controllers.insert(controller, at: controllers.count - 1)
                        navigationController.setViewControllers(controllers, animated: false)
                        navigationController.popViewController(animated: animated)
                    } else {
                        throw TransitionHandlerError.custom("Can't make `forcePop` because UINavigationController children count < 2")
                    }
                }
            }
        }
        return self
    }

    func conditionPop(_ condition: (UIViewController) -> Bool) -> CloseTransitionPromise {
        let navigationController = source
            .navigationController
            .unwrap(TransitionHandlerError.nilController("Navigation"))
        let found = navigationController.children.first {
            condition($0)
        }
        foundViewController = found
        return self
    }

    func perform() {
        do {
            try self.promise?()
        } catch {
            log.error(error)
        }
    }
}
