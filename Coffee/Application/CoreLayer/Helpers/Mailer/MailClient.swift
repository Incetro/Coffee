//
//  MailClient.swift
//  Mailer
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2017 incetro. All rights reserved.
//

import Foundation

// MARK: - MailClient

/// All available mail client types
///
/// - mail: Standard Apple's client
/// - gmail: Google client
/// - sparrow: Sparrow client
/// - dispatch: Dispatch client
/// - spark: Spark client
/// - airmail: Airmail client
enum MailClient {

    case mail
    case gmail
    case sparrow
    case dispatch
    case spark
    case airmail

    /// Returns url for opening current client
    ///
    /// - Parameters:
    ///   - recipient: e-mail recipient
    ///   - subject: e-mail subject
    ///   - body: e-mail text
    /// - Returns: url for opening current client
    func composeURL(recipient: String?, subject: String?, body: String?) -> URL? {

        var components = URLComponents(string: "\(urlScheme):\(urlRoot ?? "")")
        components?.scheme = urlScheme

        if urlRecipientKey == nil {
            if let recipient = recipient {
                components = URLComponents(string: "\(urlScheme):\(urlRoot ?? "")\(recipient)")
            }
        }

        var queryItems: [URLQueryItem] = []

        if let recipient = recipient, let urlRecipientKey = urlRecipientKey {
            queryItems.append(URLQueryItem(name: urlRecipientKey, value: recipient))
        }

        if let subject = subject, let urlSubjectKey = urlSubjectKey {
            queryItems.append(URLQueryItem(name: urlSubjectKey, value: subject))
        }

        if let body = body, let urlBodyKey = urlBodyKey {
            queryItems.append(URLQueryItem(name: urlBodyKey, value: body))
        }

        if !queryItems.isEmpty {
            components?.queryItems = queryItems
        }

        return components?.url
    }

    /// String representation
    var name: String {
        String(describing: self).capitalized
    }

    /// All available clients
    static var all: [MailClient] {
        [.mail, .gmail, .airmail, .dispatch, .spark, .sparrow]
    }

    /// URL scheme for the current client
    var urlScheme: String {
        switch self {
        case .gmail:
            return "googlegmail"
        case .sparrow:
            return "sparrow"
        case .dispatch:
            return "x-dispatch"
        case .spark:
            return "readdle-spark"
        case .airmail:
            return "airmail"
        case .mail:
            return "mailto"
        }
    }

    /// URL root for the current client
    var urlRoot: String? {
        switch self {
        case .gmail:
            return "///co"
        case .sparrow:
            return nil
        case .dispatch:
            return "///compose"
        case .spark:
            return "//compose"
        case .airmail:
            return "//compose"
        case .mail:
            return nil
        }
    }

    /// URL recipient key for the current client
    var urlRecipientKey: String? {
        switch self {
        case .gmail:
            return "to"
        case .sparrow:
            return nil
        case .dispatch:
            return "to"
        case .spark:
            return "recipient"
        case .airmail:
            return "to"
        case .mail:
            return nil
        }
    }

    /// URL subject key for the current client
    var urlSubjectKey: String? {
        switch self {
        case .gmail:
            return "subject"
        case .sparrow:
            return "subject"
        case .dispatch:
            return "subject"
        case .spark:
            return "subject"
        case .airmail:
            return "subject"
        case .mail:
            return "subject"
        }
    }

    /// URL body key for the current client
    var urlBodyKey: String? {
        switch self {
        case .gmail:
            return "body"
        case .sparrow:
            return "body"
        case .dispatch:
            return "body"
        case .spark:
            return "body"
        case .airmail:
            return "plainBody"
        case .mail:
            return "body"
        }
    }
}
