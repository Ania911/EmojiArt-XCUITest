//
//  Emoji_ArtBDDTest.swift
//  Emoji ArtUITests
//
//  Created by a.sakiv on 11.09.2020.
//  Copyright © 2020 CS193p Instructor. All rights reserved.
//
import Foundation
import XCTest

class Emoji_ArtBDDTest: Emoji_ArtBase {
    
    func testMainScreen() {
        startScreen()
        openMainScreen()
    }
    func testExistUIElement() {
        startScreen()
        plusExist()
        editExist()
    }
    func testAddNewItem() {
       startScreen()
       plus()
       addNewEmoji()
   }
    func testDeletItem()  {
        startScreen()
        deleteEmoji()
    }
    func testEditNewItem() {
        startScreen()
        plus()
        edit()
        chevronTap()
        editEmogiCell()
        returnBack()
        done()
        textExist()
    }
    func testExistingAddedItemAfterRelunchApp() {
        testEditNewItem()
        app.terminate()
        app.launch()
        startScreen()
        textExist()
    }    
    func testDeletBySwipeLeft() {
         startScreen()
         addNewEmoji()
         deleteSwipeLeft()
         textExistfalse()
    }
    func testSecondScreen() {
        startScreen()
        addNewEmojiTap()
        emptyScreen()
        activities()
        emojiSecondScreenElementsExist()
    }
}


