//
//  ViewController.swift
//  SpeechMemorizer
//
//  Created by Neil Hiddink on 1/12/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    var speeches = [SpeechItem]()
    
    // MARK: IB Outlets
    
    @IBOutlet var tableView: UITableView!
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

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


}

// MARK: - ViewController: UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let speechTextVC = self.storyboard?.instantiateViewController(withIdentifier: "SpeechTextVC") as? SpeechTextViewController {
            speechTextVC.speech = speeches[indexPath.row]
            navigationController?.pushViewController(speechTextVC, animated: true)
        }
    }
    
    // MARK: Data Source
    
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
