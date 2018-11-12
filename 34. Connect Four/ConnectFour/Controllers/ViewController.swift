//
//  ViewController.swift
//  ConnectFour
//
//  Created by Neil Hiddink on 11/7/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    override var shouldAutorotate: Bool { return true }
    override var prefersStatusBarHidden: Bool { return true }
    
    var placedChips = [[UIView]]()
    var board: Board!
    
    // MARK: - IB Outlets
    
    @IBOutlet var columnButtons: [UIButton]!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0 ..< Board.width {
            placedChips.append([UIView]())
        }
        resetBoard()
    }
    
    // MARK: - Helper Methods
    
    func resetBoard() {
        board = Board()
        for i in 0 ..< placedChips.count {
            for chip in placedChips[i] {
                chip.removeFromSuperview()
            }
            placedChips[i].removeAll(keepingCapacity: true)
        }
    }
    
    // MARK: - IB Actions
    
    @IBAction func makeMove(_ sender: UIButton) {
    
    }
    
}
