//
//  PlayData.swift
//  SwiftUnitTests
//
//  Created by Neil Hiddink on 12/11/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import Foundation

// MARK: - PlayData

class PlayData {
    
    // MARK: Properties
    
    var allWords = [String]()
    var wordCounts = [String: Int]()
    
    // MARK: Initialization
    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: ".txt") {
            if let plays = try? String(contentsOfFile: path) {
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter { $0 != "" }
                for word in allWords {
                    if wordCounts[word] == nil {
                        wordCounts[word] = 1
                    } else {
                        wordCounts[word]! += 1
                    }
                }
                allWords = Array(wordCounts.keys)
            }
        }
    }
}
