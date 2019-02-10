//
//  SpeechDataSource.swift
//  SpeechMemorizer
//
//  Created by Neil Hiddink on 1/13/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - SpeechDataSource: NSObject, UITableViewDataSource

class SpeechDataSource: NSObject, UITableViewDataSource {
    
    // MARK: Properties
    
    var speeches = [SpeechItem]()
    
    // MARK: Initializer
    
    override init() {
        guard let url = Bundle.main.url(forResource: "Speeches", withExtension: ".json") else {
            fatalError("Can't find JSON.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load JSON.")
        }
        
        let decoder = JSONDecoder()
        
        guard let savedItems = try? decoder.decode([SpeechItem].self, from: data) else {
            fatalError("Failed to decode JSON.")
        }
        
        speeches = savedItems
    }
    
    // MARK: Helper Methods
    
    func getSpeech(at index: Int) -> SpeechItem {
        return speeches[index]
    }
    
    // MARK: UITableView Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speeches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let speech = speeches[indexPath.row]
        cell.textLabel?.text = speech.title
        cell.detailTextLabel?.text = "\(speech.author) \(speech.date)"
        return cell
    }
    
}

