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
//        XCTAssertEqual(playData.allWords.count, 0, "allWords is not 0")
//        XCTAssertEqual(playData.allWords.count, 384001, "allWords was not 384001")
        XCTAssertEqual(playData.allWords.count, 18440, "allWords was not 18440")
    }
    
    func testWordCountsAreCorrect() {
        let playData = PlayData()
        XCTAssertEqual(playData.wordCounts.count(for: "home"), 174, "Home does not appear 174 times")
        XCTAssertEqual(playData.wordCounts.count(for: "fun"), 4, "Fun does not appear 4 times")
        XCTAssertEqual(playData.wordCounts.count(for: "mortal"), 41, "Mortal does not appear 41 times")
    }

    func testWordsLoadQuickly() {
        measure {
            _ = PlayData()
        }
    }
    
}
