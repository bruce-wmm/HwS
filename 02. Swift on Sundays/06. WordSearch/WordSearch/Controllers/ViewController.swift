//
//  ViewController.swift
//  WordSearch
//
//  Created by Neil Hiddink on 2/17/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.url(forResource: "capitals", withExtension: "json")!
        let contents = try! Data(contentsOf: path)
        let words = try! JSONDecoder().decode([Word].self, from: contents)
        
        let wordSearch = WordSearch()
        wordSearch.words = words
        wordSearch.makeGrid()
    }

}

