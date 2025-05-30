// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

public struct LinkInfoModel {
    let title: String
    let url: URL
    let accessibilityIdentifier: String

    public init(title: String, url: URL, accessibilityIdentifier: String) {
        self.title = title
        self.url = url
        self.accessibilityIdentifier = accessibilityIdentifier
    }
}
