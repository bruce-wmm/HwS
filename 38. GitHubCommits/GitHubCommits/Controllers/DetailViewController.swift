//
//  DetailViewController.swift
//  GitHubCommits
//
//  Created by Neil Hiddink on 12/2/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - DetailViewController: UIViewController

class DetailViewController: UIViewController {

    // MARK: Properties
    
    var detailItem: Commit?
    
    // MARK: IB Outlets
    
    @IBOutlet var detailLabel: UILabel!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detail = self.detailItem {
            detailLabel.text = detail.message
//            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit 1/\(detail.author.commits.count)",
//                                                                style: .plain, target: self,
//                                                                action: #selector(showAuthorCommits))
        }
    }

}
