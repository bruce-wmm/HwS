//
//  SwiftUnitTestsTests.swift
//  SwiftUnitTestsTests
//
//  Created by Neil Hiddink on 12/11/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import XCTest
@testable import SwiftUnitTests

class SwiftUnitTestsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 0, "allWords must be 0")
    }

}
