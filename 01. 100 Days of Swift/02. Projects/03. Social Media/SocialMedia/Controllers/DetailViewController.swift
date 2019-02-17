//
//  DetailViewController.swift
//  SocialMedia
//
//  Created by Neil Hiddink on 7/31/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: DetailViewController: UIViewController

class DetailViewController: UIViewController {
    
    // MARK: Properties
    
    var selectedImage: String?
    
    // MARK: IB Outlets
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let selectedImage = selectedImage else { return }
        detailImageView.image = UIImage(named: selectedImage)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return navigationController?.hidesBarsOnTap ?? false
    }
    
    // MARK: Helper Methods
    
    @objc func shareTapped(){
        let activityVC = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
        activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityVC, animated: true)
    }
    
}
