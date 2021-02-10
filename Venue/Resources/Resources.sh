#!/bin/sh

swiftgen run xcassets -p ./Venue/Resources/Images/appname-structured-assets.stencil ./Venue/Resources/Images/Assets.xcassets --output "Venue/Resources/Images/Images.swift"
swiftgen run strings -p ./Venue/Resources/Localization/appname-structured-strings.stencil ./Venue/Resources/Localization/ru.lproj/Localizable.strings --output "Venue/Resources/Localization/Localization.swift"
swiftgen run colors -t swift4 ./Venue/Resources/Colors/Colors.json --output "Venue/Resources/Colors/Colors.swift"
swiftgen run fonts -t swift4 ./Venue/Resources/Fonts --output "Venue/Resources/Fonts/Fonts.swift"
