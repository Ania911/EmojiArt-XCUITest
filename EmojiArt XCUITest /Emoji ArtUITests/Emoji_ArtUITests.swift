//
//  Emoji_ArtUITests.swift
//  Emoji ArtUITests
//
//  Created by a.sakiv on 01.09.2020.
//  Copyright © 2020 CS193p Instructor. All rights reserved.
//
import Foundation
import XCTest
@testable import Emoji_Art

class Emoji_ArtUITests: Emoji_ArtBase {
   
//Test exist element then load the main screen
    func testExistUIElement() {
        let plusButton = app.navigationBars["Emoji Art"].buttons["plus"]
        let editButton = app.navigationBars["Emoji Art"].buttons["Edit"]
        XCTAssertTrue(plusButton.exists)
        XCTAssertTrue(editButton.exists)
    }
    
// Test that in the first lunch the table is empty
    func testCountTableCell() {
        let count = app.tables.children(matching: .cell).count
        print(count)
        XCTAssertTrue(count == 0)
    }

// Test add the new item
    func testAddNewItem() {
        app.navigationBars["Emoji Art"].buttons["plus"].tap()
        let new = app.tables.children(matching: .cell).firstMatch.buttons["Untitled"]
        XCTAssertTrue(new.exists)
    }
    
// Test delete all cell in the table
    func testDeletItem()  {
        let count = app.tables.children(matching: .cell).count
        print (count)
        while count > 0 {
            app.navigationBars["Emoji Art"].buttons["Edit"].tap()
            let delete =  app.tables.children(matching: .cell).firstMatch.buttons["Delete "]
            delete.tap()
            let update = app.tables.children(matching: .cell).firstMatch.buttons["trailing0"]
            update.tap()
            let done =  app.buttons["Done"]
            done.tap()
        }
        XCTAssertTrue( count == 0 )
    }
        
// Test edit label text name in the table cell
    func testEditNewItem() {
        let plusButton = app.navigationBars["Emoji Art"].buttons["plus"]
        plusButton.tap()
        app.navigationBars["Emoji Art"].buttons["Edit"].tap()
        let text = app.tables.children(matching: .cell).firstMatch.buttons["chevron.right"]
        text.doubleTap()
        let deleteKey = app.keys["delete"]
        deleteKey.tap()
        let tKey = app.keys["T"]
        let eKey = app.keys["e"]
        let sKey = app.keys["s"]
        let tKey2 = app.keys["t"]
        tKey.tap()
        eKey.tap()
        sKey.tap()
        tKey2.tap()
        app.buttons["Return"].tap()
        app.navigationBars["Emoji Art"].buttons["Done"].tap()
        let newItem = app.tables.children(matching: .cell).firstMatch.buttons["Test"]
        XCTAssertTrue(newItem.exists)
    }

// Test delete edited label by swipeLeft
    func testDeletBySwipeLeft() {
        let newItem = app.tables.children(matching: .cell).firstMatch.buttons["Test"]
        let tablesQuery = app.tables.cells
        tablesQuery.firstMatch.buttons["Test"].swipeLeft()
        tablesQuery.firstMatch.buttons["trailing0"].tap()
        XCTAssertFalse(newItem.exists)
    }
    
// test that edded new item exist after relunch the app
    func testExistingAddedItemAfterRelunchApp() {
        testEditNewItem()
        app.terminate()
        app.launch()
        let newItem = app.tables.children(matching: .cell).firstMatch.buttons["Test"]
        XCTAssertTrue(newItem.exists)
    }
// test that the Activities pallete has own emojis
    func testSecondScreen() {
        app.tables.children(matching: .cell).firstMatch.tap()
        XCTAssert(app.staticTexts["Activities"].exists)
        let staticText = app.staticTexts.allElementsBoundByIndex
        print(staticText)
        XCTAssertTrue(app.staticTexts["⚽️"].exists)
        XCTAssertTrue(app.staticTexts["🏈"].exists)
        XCTAssertTrue(app.staticTexts["🏓"].exists)
 }
//test exist elements in the second screen
     func testSwitchBetwenPallets() {
        app.tables.children(matching: .cell).firstMatch.tap()
        let keyboard = app.images["keyboard"]
        keyboard.tap()
        XCTAssert(app.staticTexts["Palette Editor"].exists)
        XCTAssert(app.textFields["Activities"].exists)
        XCTAssert(app.textFields["Add Emoji"].exists)
        XCTAssert(app.staticTexts["Remove Emoji"].exists)
        XCTAssert(app.buttons["Done"].exists)
}
 // test add new emoji to the pallete
    func testAddNewEmoji() {
        app.tables.children(matching: .cell).firstMatch.tap()
        app.images["keyboard"].tap()
        let addEmoji = app.textFields["Add Emoji"]
        addEmoji.tap()
        addEmoji.typeText("🎁")
        app.buttons["Done"].tap()
        XCTAssertTrue(app.staticTexts["🎁"].exists)
    }
// test delete added new emoji in the pallete
    func testDeleteNewEmoji() {
        app.tables.children(matching: .cell).firstMatch.tap()
        app.images["keyboard"].tap()
        let deleteEmoji = app.tables.children(matching: .cell).staticTexts["🎁"]
        deleteEmoji.tap()
        XCTAssertFalse(app.staticTexts["🎁"].exists)
    }
//test add image from safari
    func testAddImageFromSafari() {
        let safariApp = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        safariApp.launch()
        let copyLink = safariApp.images["Donald Duck - Wikipedia"]
        copyLink.press(forDuration: 1.2)
        let copyButton = safariApp.buttons["Copy"]
        copyButton.tap()
        XCUIDevice.shared.press(.home)
        app.launch()
        let startScreen = app.buttons["Emoji Art"]
        startScreen.tap()
        app.navigationBars["Emoji Art"].buttons["plus"].tap()
        app.tables.children(matching: .cell).firstMatch.tap()
        let popoverdismissregionElement = app.otherElements["PopoverDismissRegion"]
        popoverdismissregionElement.tap()
        let addImage = app.buttons["doc.on.clipboard"]
        addImage.tap()
        let ok = app.alerts["Paste Background"].scrollViews.otherElements.buttons["OK"]
        ok.tap()
        sleep(5)
        XCTAssertFalse(copyLink.exists)
    }
}
