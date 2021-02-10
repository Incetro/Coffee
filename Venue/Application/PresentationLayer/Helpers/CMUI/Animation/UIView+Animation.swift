//
//  UIView+Animation.swift
//  CMUI
//
//  Created by incetro on 15/02/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - UIView

extension UIView {

    static func animate(_ tokens: [AnimationToken], completion: (() -> Void)? = nil) {
        guard !tokens.isEmpty else {
            completion?()
            return
        }
        var tokens = tokens
        let token = tokens.removeFirst()
        token.perform {
            animate(tokens, completion: completion)
        }
    }

    static func animate(_ tokens: AnimationToken..., completion: (() -> Void)? = nil) {
        animate(tokens, completion: completion)
    }

    @discardableResult func animate(_ animations: [Animation]) -> AnimationToken {
        AnimationToken(
            view: self,
            animations: animations,
            mode: .inSequence
        )
    }

    @discardableResult func animate(_ animations: Animation...) -> AnimationToken {
        animate(animations)
    }

    @discardableResult func animate(inParallel animations: [Animation]) -> AnimationToken {
        AnimationToken(
            view: self,
            animations: animations,
            mode: .inParallel
        )
    }

    @discardableResult func animate(inParallel animations: Animation...) -> AnimationToken {
        animate(inParallel: animations)
    }

    private func animate(_ animation: Animation, completion: (() -> Void)? = nil) {
        if animation.isStandard {
            UIView.animate(
                withDuration: animation.duration,
                animations: { [weak self] in
                    guard let self = self else {
                        return
                    }
                    animation.closure(self)
                },
                completion: { _ in
                    completion?()
                }
            )
        } else {
            UIView.animate(
                withDuration: animation.duration,
                delay: animation.delay ?? 0,
                usingSpringWithDamping: animation.springWithDamping ?? 0,
                initialSpringVelocity: animation.springVelocity ?? 0,
                options: animation.animationOptions ?? .curveEaseInOut,
                animations: { [weak self] in
                    guard let self = self else {
                        return
                    }
                    animation.closure(self)
                },
                completion: { _ in
                    completion?()
                }
            )
        }
    }
}

extension UIView {

    func performAnimations(_ animations: [Animation], completionHandler: (() -> Void)? = nil) {
        guard !animations.isEmpty else {
            completionHandler?()
            return
        }
        var animations = animations
        let animation = animations.removeFirst()
        animate(animation) { [weak self] in
            guard let self = self else {
                return
            }
            self.performAnimations(animations) {
                completionHandler?()
            }
        }
    }

    func performAnimations(_ animations: Animation..., completionHandler: (() -> Void)? = nil) {
        performAnimations(animations, completionHandler: completionHandler)
    }

    func performAnimationsInParallel(_ animations: [Animation], completionHandler: @escaping () -> Void) {

        // If we have no animations, we can exit early
        guard !animations.isEmpty else {
            completionHandler()
            return
        }

        // In order to call the completion handler once all animations
        // have finished, we need to keep track of these counts
        let animationCount = animations.count
        var completionCount = 0

        let animationCompletionHandler = {
            completionCount += 1
            // Once all animations have finished, we call the completion handler
            if completionCount == animationCount {
                completionHandler()
            }
        }

        for animation in animations {
            animate(animation, completion: animationCompletionHandler)
        }
    }

    func performAnimationsInParallel(_ animations: Animation..., completionHandler: @escaping () -> Void) {
        performAnimationsInParallel(animations, completionHandler: completionHandler)
    }
}
