//
//  Constants.swift
//  VenueUITests
//
//  Created by Дмитрий Савинов on 12.02.2021.
//
// swiftlint:disable nesting

import Foundation
import UIKit

enum Constants: String {

    case digits = "1234567890"

    enum Letters {

        enum Russian: String {
            case lowerCase = "йцукенгшщзхъфывапролджэёячсмитьбю"
            case upperCase = "ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЁЯЧСМИТЬБЮ"
        }

        enum English: String {
            case lowerCase = "qwertyuiopasdfghjklzxcvbnm"
            case upperCase = "QWERTYUIOPASDFGHJKLZXCVBNM"
        }
    }

    enum Keyboard: String {
        case enter = "Return"
    }

    enum UI {

        enum SignInButton: CGFloat {
            case width = 370
        }

        enum MailTextField: CGFloat {
            case width = 370
        }
    }

    case russianTwoCases = "йцукенгшщзхъфывапролджэёячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЁЯЧСМИТЬБЮ"

    case englishTwoCases = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"

    case specialSybols = "!#$%&'()*+,-./:;<=>?@[]^_`{|}~"

    case test5, test6 = "_"
    case test8 = "therun@"
    case test9 = "therun@ya"
    case test10 = "therun@ya."
    case test11 = "therun@ya.r"

    case correctMail = "sajdhg.isuad@gamail.com"
}
