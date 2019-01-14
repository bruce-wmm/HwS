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

    let dataSource = SpeechDataSource()
    
    // MARK: IB Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
    }

}

// MARK: - ViewController: UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let speechTextVC = self.storyboard?.instantiateViewController(withIdentifier: "SpeechTextVC") as? SpeechTextViewController {
            speechTextVC.speech = dataSource.getSpeech(at: indexPath.row)
            navigationController?.pushViewController(speechTextVC, animated: true)
        }
    }
    
    
    
}
