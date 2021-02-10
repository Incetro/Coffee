//
//  AnimationToken.swift
//  CMUI
//
//  Created by incetro on 15/02/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - AnimationMode

internal enum AnimationMode {
    case inSequence
    case inParallel
}

// MARK: - AnimationToken

public final class AnimationToken {

    // MARK: - Properties

    private let view: UIView
    private let animations: [Animation]
    private let mode: AnimationMode
    private var isValid = true

    // MARK: - Initializers

    // We don't want the API user to think that they should create tokens
    // themselves, so we make the initializer internal to the framework
    internal init(view: UIView, animations: [Animation], mode: AnimationMode) {
        self.view = view
        self.animations = animations
        self.mode = mode
    }

    deinit {
        // Automatically perform the animations when the token gets deallocated
        perform {}
    }

    // MARK: - Internal

    /// Perform current animations
    /// - Parameter completionHandler: completion handler
    internal func perform(completionHandler: @escaping () -> Void) {
        // To prevent the animation from being executed twice, we invalidate
        // the token once its animation has been performed
        guard isValid else {
            return
        }
        isValid = false
        switch mode {
        case .inSequence:
            view.performAnimations(animations, completionHandler: completionHandler)
        case .inParallel:
            view.performAnimationsInParallel(animations, completionHandler: completionHandler)
        }
    }
}
