//
//  Emoji_ArtSteps.swift
//  Emoji ArtUITests
//
//  Created by a.sakiv on 13.09.2020.
//  Copyright © 2020 CS193p Instructor. All rights reserved.
//

import Foundation
import XCTest

extension Emoji_ArtBase {
    
    func startScreen() {
        Emoji_ArtScreen.emojiArt.elements.tap()
    }
    func openMainScreen() {
        XCTAssertTrue(Emoji_ArtScreen.emojiArt.elements.exists)
    }
    func plus() {
        Emoji_ArtScreen.plus.elements.tap()
        XCTAssertTrue(Emoji_ArtScreen.plus.elements.exists)
    }
    func plusExist() {
        XCTAssertTrue(Emoji_ArtScreen.plus.elements.exists)
    }
    func editExist() {
        XCTAssertTrue(Emoji_ArtScreen.edit.elements.exists)
    }
    func edit() {
        Emoji_ArtScreen.edit.elements.tap()
    }
    func addNewEmoji() {
        XCTAssertTrue(Emoji_ArtScreen.addNewEmoji.elements.exists)
    }
    func addNewEmojiTap() {
        Emoji_ArtScreen.addNewEmoji.elements.firstMatch.tap()
    }
    func keyboard() {
        
    }
    func paletteEditor() {
        
    }
    func activities() {
        XCTAssert(Emoji_ArtScreen.activities.elements.exists)
    }
    func addEmoji() {
        
    }
    func removeEmoji() {
        
    }
    func done() {
        Emoji_ArtScreen.done.elements.tap()
    }
    func returnBack() {
        Emoji_ArtScreen.returnBack.elements.tap()
    }
    func deleteEmoji()  {
        let count = app.tables.children(matching: .cell).count
        edit()
        while count < 0 {
            let delete =  app.tables.children(matching: .cell).firstMatch.buttons["Delete "]
            delete.tap()
            let update = app.tables.children(matching: .cell).firstMatch.buttons["trailing0"]
            update.tap()
        }
        XCTAssertTrue( count == 0 )
    }
    func chevronTap() {
        Emoji_ArtScreen.chevron.elements.firstMatch.doubleTap()
    }
    func editEmogiCell() {
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
    }
    func textExist() {
        let newItem = app.tables.children(matching: .cell).firstMatch.buttons["Test"]
        XCTAssertTrue(newItem.exists)
    }
    func textExistfalse() {
        let newItem = app.tables.children(matching: .cell).firstMatch.buttons["Test"]
        XCTAssertFalse(newItem.exists)
    }
    func deleteSwipeLeft() {
        let tablesQuery = app.tables.cells
        tablesQuery.firstMatch.swipeLeft()
        tablesQuery.firstMatch.buttons["trailing0"].tap()
    }
    func emojiSecondScreenElementsExist() {
         XCTAssertTrue(Emoji_ArtScreen.emoji1.elements.exists)
         XCTAssertTrue(Emoji_ArtScreen.emoji2.elements.exists)
         XCTAssertTrue(Emoji_ArtScreen.emoji3.elements.exists)
    }
    func emptyScreen() {
        let popoverdismissregionElement = app.otherElements["PopoverDismissRegion"]
        popoverdismissregionElement.tap()
    }
}
