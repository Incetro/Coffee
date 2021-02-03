//
//  Animation.swift
//  CMUI
//
//  Created by incetro on 15/02/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//
// swiftlint:disable identifier_name

import UIKit

// MARK: - Animation

public struct Animation {

    // MARK: - Properties

    public let duration: TimeInterval
    public let delay: TimeInterval?
    public let springWithDamping: CGFloat?
    public let springVelocity: CGFloat?
    public let animationOptions: UIView.AnimationOptions?
    public let closure: (UIView) -> Void

    var isStandard: Bool {
        delay == nil
            && springWithDamping == nil
            && springVelocity == nil
            && animationOptions == nil
    }

    // MARK: - Initializers

    init(duration: TimeInterval,
         delay: TimeInterval? = nil,
         springWithDamping: CGFloat? = nil,
         springVelocity: CGFloat? = nil,
         animationOptions: UIView.AnimationOptions? = nil,
         closure: @escaping (UIView) -> Void) {
        self.duration = duration
        self.delay = delay
        self.springWithDamping = springWithDamping
        self.springVelocity = springVelocity
        self.animationOptions = animationOptions
        self.closure = closure
    }

    func isEqualPropeties(to animation: Animation) -> Bool {
        delay == animation.delay
            && springWithDamping == animation.springWithDamping
            && springVelocity == animation.springVelocity
            && duration == duration
            && animationOptions == animation.animationOptions
    }
}

// MARK: - Predefined

extension Animation {

    static func fadeIn(duration: TimeInterval,
                       delay: TimeInterval? = nil,
                       springWithDamping: CGFloat? = nil,
                       springVelocity: CGFloat? = nil,
                       animationOptions: UIView.AnimationOptions? = nil) -> Animation {
        Animation(
            duration: duration,
            delay: delay,
            springWithDamping: springWithDamping,
            springVelocity: springVelocity,
            animationOptions: animationOptions) {
            $0.alpha = 1
        }
    }

    static func fadeOut(duration: TimeInterval,
                        delay: TimeInterval? = nil,
                        springWithDamping: CGFloat? = nil,
                        springVelocity: CGFloat? = nil,
                        animationOptions: UIView.AnimationOptions? = nil) -> Animation {
        Animation(
            duration: duration,
            delay: delay,
            springWithDamping: springWithDamping,
            springVelocity: springVelocity,
            animationOptions: animationOptions) {
            $0.alpha = 0
        }
    }

    static func resize(to size: CGSize,
                       duration: TimeInterval,
                       delay: TimeInterval? = nil,
                       springWithDamping: CGFloat? = nil,
                       springVelocity: CGFloat? = nil,
                       animationOptions: UIView.AnimationOptions? = nil) -> Animation {
        Animation(
            duration: duration,
            delay: delay,
            springWithDamping: springWithDamping,
            springVelocity: springVelocity,
            animationOptions: animationOptions) {
            $0.bounds.size = size
        }
    }

    static func move(toX x: CGFloat,
                     y: CGFloat,
                     duration: TimeInterval,
                     delay: TimeInterval? = nil,
                     springWithDamping: CGFloat? = nil,
                     springVelocity: CGFloat? = nil,
                     animationOptions: UIView.AnimationOptions? = nil) -> Animation {
        Animation(
            duration: duration,
            delay: delay,
            springWithDamping: springWithDamping,
            springVelocity: springVelocity,
            animationOptions: animationOptions) {
            $0.frame.origin.x = x
            $0.frame.origin.y = y
        }
    }

    static func transform(_ transform: CGAffineTransform,
                          duration: TimeInterval,
                          delay: TimeInterval? = nil,
                          springWithDamping: CGFloat? = nil,
                          springVelocity: CGFloat? = nil,
                          animationOptions: UIView.AnimationOptions? = nil) -> Animation {
        Animation(
            duration: duration,
            delay: delay,
            springWithDamping: springWithDamping,
            springVelocity: springVelocity,
            animationOptions: animationOptions) {
            $0.transform = transform
        }
    }

    static func scale(x: CGFloat,
                      y: CGFloat,
                      duration: TimeInterval,
                      delay: TimeInterval? = nil,
                      springWithDamping: CGFloat? = nil,
                      springVelocity: CGFloat? = nil,
                      animationOptions: UIView.AnimationOptions? = nil) -> Animation {
        transform(.init(scaleX: x, y: y),
                  duration: duration,
                  delay: delay,
                  springWithDamping: springWithDamping,
                  springVelocity: springVelocity,
                  animationOptions: animationOptions)
    }
}
