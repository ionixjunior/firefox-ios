// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Redux
import Common

struct MoveTabData {
    let originIndex: Int
    let destinationIndex: Int
    let isPrivate: Bool
}

class TabPanelViewAction: Action {
    let panelType: TabTrayPanelType?
    let isPrivateModeActive: Bool?
    let urlRequest: URLRequest?
    let tabUUID: TabUUID?
    let selectedTabIndex: Int?
    let moveTabData: MoveTabData?
    let toastType: ToastType?
    let shareSheetURL: URL?
    let isInactiveTab: Bool?
    let deleteTabPeriod: TabsDeletionPeriod?

    init(panelType: TabTrayPanelType?,
         isPrivateModeActive: Bool? = nil,
         urlRequest: URLRequest? = nil,
         tabUUID: TabUUID? = nil,
         selectedTabIndex: Int? = nil,
         moveTabData: MoveTabData? = nil,
         toastType: ToastType? = nil,
         shareSheetURL: URL? = nil,
         isInactiveTab: Bool? = nil,
         deleteTabPeriod: TabsDeletionPeriod? = nil,
         windowUUID: WindowUUID,
         actionType: ActionType) {
        self.panelType = panelType
        self.isPrivateModeActive = isPrivateModeActive
        self.urlRequest = urlRequest
        self.tabUUID = tabUUID
        self.selectedTabIndex = selectedTabIndex
        self.moveTabData = moveTabData
        self.toastType = toastType
        self.shareSheetURL = shareSheetURL
        self.isInactiveTab = isInactiveTab
        self.deleteTabPeriod = deleteTabPeriod
        super.init(windowUUID: windowUUID,
                   actionType: actionType)
    }
}

enum TabPanelViewActionType: ActionType {
    case tabPanelDidLoad
    case tabPanelWillAppear
    case tabPanelDidAppear
    case addNewTab
    case closeTab
    case undoClose
    case closeAllTabs
    case cancelCloseAllTabs
    case confirmCloseAllTabs
    case deleteTabsOlderThan
    case undoCloseAllTabs
    case moveTab
    case toggleInactiveTabs
    case closeInactiveTab
    case undoCloseInactiveTab
    case closeAllInactiveTabs
    case undoCloseAllInactiveTabs
    case learnMorePrivateMode
    case selectTab
}

class TabPanelMiddlewareAction: Action {
    let tabDisplayModel: TabDisplayModel?
    let inactiveTabModels: [InactiveTabsModel]?
    let toastType: ToastType??
    let scrollBehavior: TabScrollBehavior?

    init(tabDisplayModel: TabDisplayModel? = nil,
         inactiveTabModels: [InactiveTabsModel]? = nil,
         toastType: ToastType? = nil,
         scrollBehavior: TabScrollBehavior? = nil,
         windowUUID: WindowUUID,
         actionType: ActionType) {
        self.tabDisplayModel = tabDisplayModel
        self.inactiveTabModels = inactiveTabModels
        self.toastType = toastType
        self.scrollBehavior = scrollBehavior
        super.init(windowUUID: windowUUID,
                   actionType: actionType)
    }
}

enum TabPanelMiddlewareActionType: ActionType {
    case didLoadTabPanel
    case willAppearTabPanel
    case didChangeTabPanel
    case refreshTabs
    case refreshInactiveTabs
    case showToast
    case scrollToTab
}

final class ScreenshotAction: Action {
    let tab: Tab

    init(windowUUID: WindowUUID, tab: Tab, actionType: any ActionType) {
        self.tab = tab
        super.init(windowUUID: windowUUID, actionType: actionType)
    }
}

enum ScreenshotActionType: ActionType {
    case screenshotTaken
}
