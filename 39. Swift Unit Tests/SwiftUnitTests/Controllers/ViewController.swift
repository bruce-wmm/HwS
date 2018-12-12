//
//  ViewController.swift
//  SwiftUnitTests
//
//  Created by Neil Hiddink on 12/11/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController 

class ViewController: UIViewController {

    // MARK: Properties
    
    var playData = PlayData()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

// MARK: - ViewController: UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playData.allWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayCell", for: indexPath)
        let word = playData.allWords[indexPath.row]
        cell.textLabel!.text = word
        cell.detailTextLabel!.text = "\(playData.wordCounts[word]!)"
        return cell
    }
    
}


