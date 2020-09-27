//
//  Emoji_ArtUIElements.swift
//  Emoji ArtUITests
//
//  Created by a.sakiv on 13.09.2020.
//  Copyright © 2020 CS193p Instructor. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {

enum Emoji_ArtScreen : String {
    
   // case emojiArt = "Emoji Art"
    case keyboard = "keyboard"
    case pallete = "Palette Editor"
    case activities = "Activities"
    case addEmoji = "Add Emoji"
    case removeEmoji = "Remove Emoji"
    case done = "Done"
    case plus = "plus"
    case edit = "Edit"
    case emojiArt = "Emoji Art"
    case addNewEmoji = "Untitled"
    case chevron = "chevron.right"
    case returnBack = "Return"
    case emoji1 = "⚽️"
    case emoji2 = "🏈"
    case emoji3 = "🏓"
    
    var elements: XCUIElement {
        switch self {
        case .addEmoji:
            return XCUIApplication().textFields[self.rawValue]
        case .pallete, .removeEmoji, .emoji1, .emoji2, .emoji3, .activities:
            return XCUIApplication().staticTexts[self.rawValue]
        case .done, .plus, .edit, .emojiArt, .addNewEmoji, .chevron, .returnBack:
            return XCUIApplication().firstMatch.buttons[self.rawValue]
        case .keyboard:
            return XCUIApplication().images[self.rawValue]
        }
    }
    
    }
}
