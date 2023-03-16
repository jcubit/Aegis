//
//  AegisUITests.swift
//  AegisUITests
//
//  Created by Javier Cuesta on 16.03.23.
//

import XCTest

final class D2HeroesUITests: XCTestCase {

    override func setUp()  {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state
        let app = XCUIApplication()
        app.launchArguments = ["-runTest 1"]
    }

    func test_heroes_exist() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.isDisplayingHeroes)
    }

    func test_hero_profile_image_exits_in_detail_view() throws {
        let app = XCUIApplication()
        app.launch()

        let heroButtons = app.buttons["HeroView"]
        XCTAssertTrue(heroButtons.waitForExistence(timeout: TimeInterval(2)))
        heroButtons.firstMatch.tap()
        XCTAssertTrue(app.isDisplayingHeroProfileImage)
    }

    func test_hero_settings_exist() throws {
        let app = XCUIApplication()
        app.launch()

        let settingsButton = app.buttons["SettingsButton"]
        XCTAssertTrue(settingsButton.waitForExistence(timeout: TimeInterval(2)))
        settingsButton.tap()

        let pickerButton = app.buttons["PrimaryAttributeButton"]
        XCTAssertTrue(pickerButton.waitForExistence(timeout: TimeInterval(2)))
    }

    func test_settings_attribute_filter_picker_exists() throws {
        let app = XCUIApplication()
        app.launch()

        let settingsButton = app.buttons["SettingsButton"]
        XCTAssertTrue(settingsButton.waitForExistence(timeout: TimeInterval(2)))
        settingsButton.tap()

        let pickerButton = app.buttons["PrimaryAttributeButton"]
        XCTAssertTrue(pickerButton.waitForExistence(timeout: TimeInterval(2)))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

