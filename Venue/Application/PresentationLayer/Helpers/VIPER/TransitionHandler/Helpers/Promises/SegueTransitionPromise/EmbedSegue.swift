//
//  EmbedSegue.swift
//  TransitionHandler
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 incetro. All rights reserved.
//

import UIKit

// MARK: - EmbedSegue

final class EmbedSegue: UIStoryboardSegue {

    override func perform() {

        guard let identifier = identifier else {
            return
        }

        let parentViewController = source
        let embedViewController = destination

        guard let containerView = (parentViewController as? EmbedSegueViewController)?.container(forSefueIdentifier: identifier) else {
            return
        }

        guard let rootView = embedViewController.view else {
            return
        }

        parentViewController.addChild(embedViewController)
        containerView.addSubview(rootView)
        embedViewController.didMove(toParent: parentViewController)

        rootView.translatesAutoresizingMaskIntoConstraints = false

        let attributes: [NSLayoutConstraint.Attribute] = [.left, .right, .top, .bottom]
        let constraints = attributes.map {
            NSLayoutConstraint(item: rootView, attribute: $0, relatedBy: .equal, toItem: containerView, attribute: $0, multiplier: 1, constant: 0)
        }
        containerView.addConstraints(constraints)
    }
}
