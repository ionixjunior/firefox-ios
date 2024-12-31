// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Storage
struct ContextMenuConfiguration: Equatable {
    var homepageSection: HomepageSection
    var sourceView: UIView?

    var site: Site? {
        switch item {
        case .topSite(let state, _):
            return state.site
        case .pocket(let state):
            return Site(url: state.url?.absoluteString ?? "",
                        title: state.title)
        case .pocketDiscover(let state):
            return Site(url: state.url?.absoluteString ?? "",
                        title: state.title)
        default:
            return nil
        }
    }

    private var item: HomepageItem?

    init(
        homepageSection: HomepageSection,
        item: HomepageItem? = nil,
        sourceView: UIView? = nil
    ) {
        self.homepageSection = homepageSection
        self.item = item
        self.sourceView = sourceView
    }
}