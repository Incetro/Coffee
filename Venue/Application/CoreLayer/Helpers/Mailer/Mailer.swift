//
//  Mailer.swift
//  Mailer
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2017 incetro. All rights reserved.
//

import UIKit

// MARK: - Mailer

final class Mailer {

    /// Object which can open urls
    private let application: UIApplicationOpenURLProtocol

    /// Default initializer
    ///
    /// - Parameter application: object which can open urls
    init(application: UIApplicationOpenURLProtocol) {
        self.application = application
    }

    /// Checks e-mail client for availability
    ///
    /// - Parameter client: checkable client
    /// - Returns: true if client is available
    func isMailClientAvailable(_ client: MailClient) -> Bool {
        var components = URLComponents()
        components.scheme = client.urlScheme
        guard let URL = components.url else {
            return false
        }
        return application.canOpenURL(URL)
    }

    /// Open some client's app
    ///
    /// - Parameters:
    ///   - client: openable client
    ///   - recipient: e-mail recipient
    ///   - subject: e-mail subject
    ///   - body: e-mail text
    /// - Returns: true if an application can open the given URL
    @discardableResult func openMailClient(_ client: MailClient, recipient: String?, subject: String?, body: String?) -> Bool {
        if let url = client.composeURL(recipient: recipient, subject: subject, body: body) {
            return application.openURL(url)
        } else {
            return false
        }
    }
}
