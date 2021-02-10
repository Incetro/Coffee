//
//  EmbedSegueViewController.swift
//  TransitionHandler
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 incetro. All rights reserved.
//

import UIKit

// MARK: - EmbedSegueViewController

protocol EmbedSegueViewController {

    func container(forSefueIdentifier identifier: String) -> UIView
}
