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
    
    // MARK: Properties
    
    var selectedImage: String?
    var titleText: (x: Int, y: Int)?
    
    var pinchRecognizer: UIPinchGestureRecognizer!
    
    // MARK: IB Outlets
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let titleText = titleText {
            title = "Picture \(titleText.x + 1) of \(titleText.y)"
        } else {
            title = selectedImage
        }
        
        navigationItem.largeTitleDisplayMode = .never
        
        pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(sender:)))
        view.addGestureRecognizer(pinchRecognizer)
        
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
    
    @objc func handlePinch(sender: UIPinchGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            detailImageView.transform = detailImageView.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1.0
        }
    }
    
}
