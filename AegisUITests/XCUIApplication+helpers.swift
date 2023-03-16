//
//  XCUIApplication+helpers.swift
//  AegisUITests
//
//  Created by Javier Cuesta on 16.03.23.
//

import XCTest

extension XCUIApplication {

    var timeout: TimeInterval { TimeInterval(2) }

    var isDisplayingHeroes: Bool {
        return buttons["HeroView"].waitForExistence(timeout: timeout)
    }

    var isDisplayingHeroProfileImage: Bool {
        return images["HeroProfileImage"].waitForExistence(timeout: timeout)
    }

    var isDisplayingSettingsTab: Bool {
        return buttons["SettingsButton"].waitForExistence(timeout: timeout)
    }
}
