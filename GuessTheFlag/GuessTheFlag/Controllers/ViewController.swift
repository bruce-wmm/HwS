//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Neil Hiddink on 8/1/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    var countries = [String]()
    
    var countryString: String?
    
    var topCountry: String?
    var middleCountry: String?
    var bottomCountry: String?
    
    // MARK: IB Outlets
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGame()
    }
    
    // MARK: Private Methods
    
    private func setupGame() {
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco",
                     "nigeria", "poland", "russia", "spain", "uk", "us"]
        questionLabel.text! = askQuestion()
    }
    
    private func askQuestion() -> String {
        
        let random1 = Int(arc4random_uniform(12))
        let random2 = Int(arc4random_uniform(12))
        let random3 = Int(arc4random_uniform(12))
        
        guard random1 != random2, random1 != random3, random2 != random3 else { return ""}
        
        topButton.setImage(UIImage(named: countries[random1]), for: .normal)
        middleButton.setImage(UIImage(named: countries[random2]), for: .normal)
        bottomButton.setImage(UIImage(named: countries[random3]), for: .normal)
        
        let randomQ = Int(arc4random_uniform(3))
        
        switch randomQ {
            case 1:
                countryString = countries[random1]
                topCountry = countryString
            case 2:
                countryString = countries[random2]
                middleCountry = countryString
            case 3:
                countryString = countries[random3]
                bottomCountry = countryString
            default:
                break
        }
        
        return "Please select the flag for:\n\(countryString!.uppercased())"
    }

    // MARK: IB Actions
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var testString = ""
        switch sender {
            case topButton:
                testString = self.topCountry!
            case middleButton:
                testString = self.middleCountry!
            case bottomButton:
                testString = self.bottomCountry!
            default:
                break
        }
        
        if let countryString = countryString {
            if countryString == testString {
                questionLabel.text = "CORRECT"
            } else {
                questionLabel.text = "TRY AGAIN"
            }
        }
    }
    
}

