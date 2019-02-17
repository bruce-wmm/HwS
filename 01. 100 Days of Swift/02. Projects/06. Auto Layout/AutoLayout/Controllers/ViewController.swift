//
//  ViewController.swift
//  AutoLayout
//
//  Created by Neil Hiddink on 8/1/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    var countries = [String]()
    var buttons = [UIButton]()
    
    var countryString = ""
    
    var topCountry: String?
    var middleCountry: String?
    var bottomCountry: String?
    
    var score = 0
    
    // MARK: IB Outlets
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var topStatusLabel: UILabel!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var middleStatusLabel: UILabel!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var bottomStatusLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco",
                     "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        buttons = [topButton, middleButton, bottomButton]
        for button in buttons {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        askQuestion()
    }
    
    // MARK: Private Methods
    
    private func resetGame(action: UIAlertAction! = nil) {
        
        askQuestion()
        
        topStatusLabel.text = nil
        middleStatusLabel.text = nil
        bottomStatusLabel.text = nil
    }
    
    private func askQuestion() {
        
        var threeUniqueValues = false
        var random1 = 0
        var random2 = 0
        var random3 = 0
        while threeUniqueValues == false {
        
            random1 = Int(arc4random_uniform(UInt32(countries.count)))
            random2 = Int(arc4random_uniform(UInt32(countries.count)))
            random3 = Int(arc4random_uniform(UInt32(countries.count)))
            
            if random1 != random2, random1 != random3, random2 != random3 {
                threeUniqueValues = true
                
                let randomQ = Int(arc4random_uniform(3))
                switch randomQ {
                    case 1:
                        countryString = countries[random1]
                    case 2:
                        countryString = countries[random2]
                    case 3:
                        countryString = countries[random3]
                    default:
                        break
                }
                
                topButton.setImage(UIImage(named: countries[random1]), for: .normal)
                topCountry = countries[random1]
                middleButton.setImage(UIImage(named: countries[random2]), for: .normal)
                middleCountry = countries[random2]
                bottomButton.setImage(UIImage(named: countries[random3]), for: .normal)
                bottomCountry = countries[random3]
                
                questionLabel.text = "Please select the flag for:\n\((countryString.uppercased()))"
                
                break
            }
            
        }
        
    }
    
    private func updateScore(correct: Bool) {
        var titleString = ""
        if correct {
            score += 1
            titleString = "Correct"
        } else {
            score -= 1
            titleString = "Incorrect"
        }
        
        let alert = UIAlertController(title: titleString, message: "Score: \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default) { _ in
            self.resetGame()
        })
        present(alert, animated: true)
    }

    // MARK: IB Actions
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        topStatusLabel.text = nil
        middleStatusLabel.text = nil
        bottomStatusLabel.text = nil
        
        switch sender {
            case topButton:
                if countryString.uppercased() == self.topCountry?.uppercased() {
                    topStatusLabel.text = "✓"
                    topStatusLabel.textColor = UIColor.green
                    updateScore(correct: true)
                } else {
                    topStatusLabel.text = "✗"
                    topStatusLabel.textColor = UIColor.red
                    updateScore(correct: false)
                }
            case middleButton:
                if countryString.uppercased() == self.middleCountry?.uppercased() {
                    middleStatusLabel.text = "✓"
                    topStatusLabel.textColor = UIColor.green
                    updateScore(correct: true)
                } else {
                    middleStatusLabel.text = "✗"
                    topStatusLabel.textColor = UIColor.red
                    updateScore(correct: false)
                }
            case bottomButton:
                if countryString.uppercased() == self.bottomCountry?.uppercased() {
                    bottomStatusLabel.text = "✓"
                    topStatusLabel.textColor = UIColor.green
                    updateScore(correct: true)
                } else {
                    bottomStatusLabel.text = "✗"
                    topStatusLabel.textColor = UIColor.red
                    updateScore(correct: false)
                }
            default:
                break
        }
    }
    
}

