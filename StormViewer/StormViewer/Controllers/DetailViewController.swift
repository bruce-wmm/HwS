//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Neil Hiddink on 7/31/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: DetailViewController: UIViewController

class DetailViewController: UIViewController {
    
    var selectedImage: String?
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let selectedImage = selectedImage else { return }
        detailImageView.image = UIImage(named: selectedImage)
    }
    
}
