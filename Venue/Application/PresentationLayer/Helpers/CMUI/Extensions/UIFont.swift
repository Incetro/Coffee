//
//  UIFont.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - UIFont

extension UIFont {

    static func SFProBoldItalic(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-BoldItalic", size: size).unwrap()
    }

    static func SFProBlackItalic(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-BlackItalic", size: size).unwrap()
    }

    static func SFProHeavyItalic(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-HeavyItalic", size: size).unwrap()
    }

    static func SFProUltralightItalic(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-UltralightItalic", size: size).unwrap()
    }

    static func SFProHeavy(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-Heavy", size: size).unwrap()
    }

    static func SFProMediumItalic(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-MediumItalic", size: size).unwrap()
    }

    static func SFProLight(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-Light", size: size).unwrap()
    }

    static func SFProBlack(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-Black", size: size).unwrap()
    }

    static func SFProRegular(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-Regular", size: size).unwrap()
    }

    static func SFProUltralight(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-Ultralight", size: size).unwrap()
    }

    static func SFProBold(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-Bold", size: size).unwrap()
    }

    static func SFProThin(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-Thin", size: size).unwrap()
    }

    static func SFProThinItalic(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-ThinItalic", size: size).unwrap()
    }

    static func SFProRegularItalic(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-RegularItalic", size: size).unwrap()
    }

    static func SFProSemibold(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-Semibold", size: size).unwrap()
    }

    static func SFProLightItalic(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-LightItalic", size: size).unwrap()
    }

    static func SFProMedium(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-Medium", size: size).unwrap()
    }

    static func SFProSemiboldItalic(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "SFProText-SemiboldItalic", size: size).unwrap()
    }

    var monospacedDigitFont: UIFont {
        let newFontDescriptor = fontDescriptor.monospacedDigitFontDescriptor
        return UIFont(descriptor: newFontDescriptor, size: 0)
    }
}

// MARK: - UIFontDescriptor

extension UIFontDescriptor {
    var monospacedDigitFontDescriptor: UIFontDescriptor {
        let fontDescriptorFeatureSettings = [[
            UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
            UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector
        ]]
        let fontDescriptorAttributes = [UIFontDescriptor.AttributeName.featureSettings: fontDescriptorFeatureSettings]
        let fontDescriptor = self.addingAttributes(fontDescriptorAttributes)
        return fontDescriptor
    }
}
