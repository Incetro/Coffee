//
//  BlurredNavigationController.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit
import DeviceKit

// MARK: - BlurredNavigationController

final class BlurredNavigationController: UINavigationController {

    lazy var minHeight: CGFloat = {
        Device.realDevice(from: .current).diagonal > 5 ? 88 : 64
    }()

    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))

    override var childForStatusBarStyle: UIViewController? {
        topViewController?.childForStatusBarStyle ?? topViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        visualEffectView.frame = .init(
            x: 0,
            y: 0,
            width: navigationBar.bounds.width,
            height: max(navigationBar.bounds.height, minHeight)
        )
        guard visualEffectView.superview == nil else {
            return
        }
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.subviews[0].addSubview(visualEffectView)
        navigationBar.subviews[0].sendSubviewToBack(visualEffectView)
        visualEffectView.subviews[1].backgroundColor = UIColor.black.withAlphaComponent(0)
    }

    func blur(enabled: Bool) {
        visualEffectView.alpha = enabled ? 1 : 0
    }

    func sendBlurToBack() {
        navigationBar.sendSubviewToBack(visualEffectView)
    }
}

extension UIViewController {

    var blurredNavigationController: BlurredNavigationController? {
        navigationController as? BlurredNavigationController
    }
}

extension UINavigationController: Designable {

    func design(appearance: Appearance) {
        if #available(iOS 13.0, *) {
        } else {
            navigationBar.barTintColor = appearance.color
        }
    }
}
