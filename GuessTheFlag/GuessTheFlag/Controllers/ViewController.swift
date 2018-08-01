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
    var buttons = [UIButton]()
    
    var countryString: String?
    
    var topCountry: String?
    var middleCountry: String?
    var bottomCountry: String?
    
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
        
        setupGame()
    }
    
    // MARK: Private Methods
    
    private func setupGame() {
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco",
                     "nigeria", "poland", "russia", "spain", "uk", "us"]
        questionLabel.text! = askQuestion()
        
        buttons = [topButton, middleButton, bottomButton]
        for button in buttons {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
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
        switch sender {
            case topButton:
                if countryString == self.topCountry! {
                    topStatusLabel.text = "✓"
                } else {
                    topStatusLabel.text = "✗"
                }
            case middleButton:
                if countryString == self.middleCountry! {
                    middleStatusLabel.text = "✓"
                } else {
                    middleStatusLabel.text = "✗"
                }
            case bottomButton:
                if countryString == self.bottomCountry! {
                    bottomStatusLabel.text = "✓"
                } else {
                    bottomStatusLabel.text = "✗"
                }
            default:
                break
        }
    }
    
}

