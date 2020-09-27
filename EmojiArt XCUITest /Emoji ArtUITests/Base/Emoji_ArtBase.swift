//
//  Emoji_ArtBase.swift
//  Emoji ArtUITests
//
//  Created by a.sakiv on 01.09.2020.
//  Copyright © 2020 CS193p Instructor. All rights reserved.
//


import Foundation
import XCTest

class Emoji_ArtBase: XCTestCase {
    
    var app = XCUIApplication()
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
}


