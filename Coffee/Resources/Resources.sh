#!/bin/sh

swiftgen run xcassets -p ./Coffee/Resources/Images/appname-structured-assets.stencil ./Coffee/Resources/Images/Assets.xcassets --output "Coffee/Resources/Images/Images.swift"
swiftgen run strings -p ./Coffee/Resources/Localization/appname-structured-strings.stencil ./Coffee/Resources/Localization/ru.lproj/Localizable.strings --output "Coffee/Resources/Localization/Localization.swift"
swiftgen run colors -t swift4 ./Coffee/Resources/Colors/Colors.json --output "Coffee/Resources/Colors/Colors.swift"
swiftgen run fonts -t swift4 ./Coffee/Resources/Fonts --output "Coffee/Resources/Fonts/Fonts.swift"
