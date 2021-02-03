//
//  CMHUD.swift
//  CMUI
//
//  Created by incetro on 2/22/20.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - CMHUD

final public class CMHUD: UIView {

    // MARK: - Constants

    /// CMHUD general id
    private static let accessiilityIdentifier = "com.catchme.CMHUD.id"

    /// CMHUD progress id
    private static let progressAccessiilityIdentifier = "\(accessiilityIdentifier).progress"

    /// CMHUD indication id
    private static let indicationAccessiilityIdentifier = "\(accessiilityIdentifier).loading"

    /// CMHUD success id
    private static let successAccessiilityIdentifier = "\(accessiilityIdentifier).success"

    /// CMHUD error id
    private static let errorAccessiilityIdentifier = "\(accessiilityIdentifier).error"

    /// CMHUD wrapping view id
    private static let wrapperAccessiilityIdentifier = "com.catchme.CMHUD-wrapper.id"

    /// Current constants
    private enum Constants {

        /// HUD side size
        static let size: CGFloat = 80

        /// Current view's corner radius
        static let cornerRadius: CGFloat = 13

        /// Initial hud transform (before appearing animation)
        static let initialTransform: CGAffineTransform = .init(scaleX: 0.75, y: 0.75)
    }

    // MARK: - Properties

    /// True if some hud is on the screen now
    private static var isShowing = false

    /// Current blur view
    private let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))

    /// View that displaying in the center of HUD
    private let contentView: UIView

    // MARK: - Initializers

    /// Default internal initialzier
    /// - Parameter contentView: view that displaying in the center of HUD
    internal init(contentView: UIView) {
        self.contentView = contentView
        super.init(frame:
            CGRect(origin: .zero, size: CGSize(width: CMHUD.Constants.size, height: CMHUD.Constants.size))
        )
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        visualEffectView.frame = bounds
        smoothlyRoundCourners(radius: CMHUD.Constants.cornerRadius)
    }

    // MARK: - Private

    /// Some hud setup
    private func setup() {
        addSubview(visualEffectView)
        addSubview(contentView)
        contentView.center = CGPoint(x: CMHUD.Constants.size / 2, y: CMHUD.Constants.size / 2)
    }

    // MARK: - Public

    /// Styles the current view
    /// - Parameter appearance: some colors and styles
    public func design(appearance: CMHUDAppearance) {
        visualEffectView.subviews[1].backgroundColor = appearance.backgroundColor
    }

    /// Shows somw hud instance in the given view
    /// - Parameters:
    ///   - hud: some hud instance
    ///   - view: some view for hud showing
    ///   - animated: true if need to animate this action
    private static func show(
        hud: CMHUD,
        in view: UIView,
        animated: Bool,
        withId identifier: String
    ) {
        var animated = animated
        if view.isContainsHUD {
            animated = false
            hide(from: view, animated: animated, animationDuration: 0.6)
        }
        hud.alpha = animated ? 0 : 1
        hud.transform = animated ? CMHUD.Constants.initialTransform : .identity
        hud.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        let wrappingView = UIView(frame: view.frame)
        view.addSubview(wrappingView)
        wrappingView.accessibilityIdentifier = wrapperAccessiilityIdentifier
        wrappingView.addSubview(hud)
        if animated {
            hud.animate(inParallel:
                .fadeIn(duration: 0.3,
                        springWithDamping: 0.5,
                        springVelocity: 0.5),
                .transform(.identity,
                           duration: 0.3,
                           springWithDamping: 0.5,
                           springVelocity: 0.5)
            )
        }
    }

    /// Show loading indicator in some view
    /// - Parameters:
    ///   - view: some view for showing hud inside
    ///   - appearance: some colors and styles
    ///   - animated: true if need to animate hud appearance
    public static func loading(in view: UIView,
                               withAppearance appearance: CMHUDAppearance = .standard,
                               animated: Bool = true) {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.startAnimating()
        activityIndicator.color = .white
        activityIndicator.transform = .init(scaleX: 1.75, y: 1.75)
        let hud = CMHUD(contentView: activityIndicator)
        hud.design(appearance: appearance)
        show(hud: hud, in: view, animated: animated, withId: indicationAccessiilityIdentifier)
    }

    /// Shows hud with image in center
    /// - Parameters:
    ///   - image: some image
    ///   - view: some view for hud presenting
    ///   - appearance: colors and styles for hud
    ///   - imageSize: preferred image size
    ///   - animated: true if need to animate hud appearance
    public static func show(image: UIImage,
                            in view: UIView,
                            withAppearance appearance: CMHUDAppearance = .standard,
                            identifier: String,
                            imageSize: CGSize,
                            animated: Bool = true) {
        let imageWrappingView = UIView()
        imageWrappingView.frame.size = CGSize(width: 44, height: 44)
        imageWrappingView.layer.cornerRadius = imageWrappingView.frame.height / 2
        let imageView = UIImageView(image: image)
        imageView.frame.size = imageSize
        imageWrappingView.backgroundColor = appearance.centralViewBackgroundColor
        imageWrappingView.addSubview(imageView)
        imageView.center = imageWrappingView.center
        let hud = CMHUD(contentView: imageWrappingView)
        hud.design(appearance: appearance)
        show(hud: hud, in: view, animated: animated, withId: identifier)
    }

    /// Shows success state inside hud
    /// - Parameters:
    ///   - view: some view for hud presenting
    ///   - appearance: colors anf styles for hud
    ///   - animated: true if need to animate hud appearance
    ///   - interval: the interval after which it needs to be hidden
    public static func success(in view: UIView,
                               withAppearance appearance: CMHUDAppearance = .standard,
                               animated: Bool = true,
                               hideAfter interval: Double = 1.33) {
        let bundle = Bundle(for: CMHUD.self)
        let image = UIImage(named: "success", in: bundle, compatibleWith: nil).unwrap()
        show(
            image: image,
            in: view,
            withAppearance: appearance,
            identifier: successAccessiilityIdentifier,
            imageSize: CGSize(width: 28, height: 20),
            animated: animated
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            hide(from: view, animated: animated)
        }
    }

    /// Shows error state inside hud
    /// - Parameters:
    ///   - view: some view for hud presenting
    ///   - appearance: colors anf styles for hud
    ///   - animated: true if need to animate hud appearance
    ///   - interval: the interval after which it needs to be hidden
    public static func error(in view: UIView,
                             withAppearance appearance: CMHUDAppearance = .standard,
                             animated: Bool = true,
                             hideAfter interval: Double = 1.33) {
        let bundle = Bundle(for: CMHUD.self)
        let image = UIImage(named: "error", in: bundle, compatibleWith: nil).unwrap()
        show(image: image,
             in: view,
             withAppearance: appearance,
             identifier: errorAccessiilityIdentifier,
             imageSize: CGSize(width: 20, height: 20),
             animated: animated
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            hide(from: view, animated: animated)
        }
    }

    /// Shows progress view
    /// - Parameters:
    ///   - progress: progress value
    ///   - view: some view for hud presenting
    ///   - appearance: colors anf styles for hud
    ///   - animated: true if need to animate hud appearance
    public static func progress(_ progress: Double,
                                in view: UIView,
                                withAppearance appearance: CMHUDAppearance = .standard,
                                animated: Bool = true) {
        if let hud = view.hud, let circleView = hud.contentView as? ProgressView {
            circleView.updateWith(progress: CGFloat(progress))
        } else {
            let circleView = ProgressView()
            circleView.frame.size = CGSize(width: 44, height: 44)
            circleView.layer.cornerRadius = circleView.frame.height / 2
            circleView.backgroundColor = appearance.centralViewBackgroundColor
            circleView.fillColor = appearance.centralViewContentColor
            circleView.updateWith(progress: CGFloat(progress))
            let hud = CMHUD(contentView: circleView)
            hud.design(appearance: appearance)
            show(hud: hud, in: view, animated: animated, withId: progressAccessiilityIdentifier)
        }
        if progress >= 1 {
            hide(from: view, animated: animated, delay: 0.125)
        }
    }

    /// Hides some hud from the given view
    /// - Parameters:
    ///   - view: some view with hud
    ///   - animated: true if need to animate hiding
    public static func hide(from view: UIView,
                            animated: Bool = true,
                            delay: TimeInterval = 0,
                            animationDuration: Double = 0.3) {
        guard let wrapperView = view.subview(withId: wrapperAccessiilityIdentifier) else {
            return
        }
        if animated {
            UIView.animate(
                wrapperView.animate(inParallel:
                    .fadeOut(duration: animationDuration,
                             delay: delay,
                             springWithDamping: 0.5,
                             springVelocity: 0.5),
                    .transform(CMHUD.Constants.initialTransform,
                               duration: animationDuration,
                               delay: delay,
                               springWithDamping: 0.5,
                               springVelocity: 0.5)
                )
            ) {
                wrapperView.removeFromSuperview()
            }
        } else {
            wrapperView.removeFromSuperview()
        }
    }
}

// MARK: - UIView

extension UIView {

    var isContainsHUD: Bool {
        hud != nil
    }

    var hud: CMHUD? {
        subviews.compactMap {
            $0.subviews.compactMap { $0 as? CMHUD }.first
        }.first
    }
}

// MARK: - ProgressView

private final class ProgressView: UIView {

    // MARK: - Properties

    private var progress: CGFloat = 0 {
        didSet {
            progressLayer?.progress = progress
        }
    }

    private var progressLayer: ProgressLayer? {
        layer as? ProgressLayer
    }

    override class var layerClass: AnyClass {
        ProgressLayer.self
    }

    override var backgroundColor: UIColor? {
        didSet {
            self.layer.backgroundColor = backgroundColor?.cgColor
        }
    }

    var fillColor: UIColor = .white {
        didSet {
            progressLayer?.fillColor = fillColor.cgColor
        }
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        genericInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        genericInit()
    }

    // MARK: - Private

    private func genericInit() {
        isOpaque = false
        layer.contentsScale = UIScreen.main.scale
        layer.setNeedsDisplay()
    }

    // MARK: - Internal

    func updateWith(progress: CGFloat) {
        self.progress = progress
    }
}

// MARK: - ProgressLayer

private final class ProgressLayer: CALayer {

    var fillColor: CGColor = UIColor.white.cgColor

    @NSManaged var progress: CGFloat

    override class func needsDisplay(forKey key: String) -> Bool {
        key == "progress" || super.needsDisplay(forKey: key)
    }

    override func action(forKey event: String) -> CAAction? {
        if event == "progress" {
            let animation = CABasicAnimation(keyPath: event)
            animation.duration = 0.125
            animation.fromValue = presentation()?.value(forKey: event) ?? 0
            return animation
        }
        return super.action(forKey: event)
    }

    override func draw(in ctx: CGContext) {

        guard progress > 0 else {
            return
        }

        let circleRect = self.bounds
        let backgroundColor = self.backgroundColor ?? UIColor.white.cgColor

        ctx.setFillColor(fillColor)
        ctx.fillEllipse(in: circleRect)

        let radius = min(circleRect.midX, circleRect.midY)
        let center = CGPoint(x: radius, y: circleRect.midY)
        let startAngle = CGFloat(-(Double.pi / 2))
        let endAngle = CGFloat(startAngle + 2 * CGFloat(Double.pi * Double(progress)))

        ctx.setFillColor(backgroundColor)
        ctx.move(to: CGPoint(x: center.x, y: center.y))
        ctx.addArc(center: CGPoint(x: center.x, y: center.y),
                   radius: radius,
                   startAngle: startAngle,
                   endAngle: endAngle,
                   clockwise: true)
        ctx.closePath()
        ctx.fillPath()
    }
}
