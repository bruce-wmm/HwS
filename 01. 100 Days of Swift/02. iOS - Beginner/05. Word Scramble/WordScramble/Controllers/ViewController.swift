//
//  ViewController.swift
//  WordScramble
//
//  Created by Neil Hiddink on 8/2/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import GameplayKit

// MARK: ViewController: UITableViewController

class ViewController: UITableViewController {

    // MARK: Properites
    
    var allWords = [String]()
    var usedWords = [String]()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))

        if let path = Bundle.main.path(forResource: "start", ofType: "txt") {
            if let startWords = try? String(contentsOfFile: path) {
                allWords = startWords.components(separatedBy: "\n")
            }
        } else {
            allWords = ["silkworm"]
        }
        
        startGame()
        
    }
    
    // MARK: Helper Functions
    
    func startGame() {
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
        title = allWords[0]
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func promptForAnswer() {
        let alert = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        alert.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned self, alert] (UIAlertAction) in
            let answer = alert.textFields![0]
            self.submit(answer: answer.text!)
        }
        
        alert.addAction(submitAction)
        present(alert, animated: true)
    }
    
    func submit(answer: String) {
        
        let lowercasedAnswer = answer.lowercased()
        let errorTitle: String
        let errorMessage: String
        var alert = UIAlertController()
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        guard checkPossible(word: lowercasedAnswer) else {
            errorTitle = "Word not recognized"
            errorMessage = "You can't just make them up, you know!"
            alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
            present(alert, animated: true)
            return
        }
        guard checkOriginal(word: lowercasedAnswer) else {
            errorTitle = "Word used already"
            errorMessage = "Be more original!"
            alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
            present(alert, animated: true)
            return
        }
        
        guard checkReal(word: lowercasedAnswer) else {
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from '\(title!.lowercased())'!"
            alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
            present(alert, animated: true)
            return
        }
        
        usedWords.insert(answer, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    func checkPossible(word: String) -> Bool  {
        var tempWord = title!.lowercased()
        
        for letter in word {
            if let possibleWord = tempWord.range(of: String(letter)) {
                tempWord.remove(at: possibleWord.lowerBound)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func checkOriginal(word: String) -> Bool  {
        return !usedWords.contains(word)
    }
    
    func checkReal(word: String) -> Bool  {
        let checker = UITextChecker()
        let range = NSMakeRange(0, word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
}

// MARK: TableView Delegate and Data Source Methods

extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
}
