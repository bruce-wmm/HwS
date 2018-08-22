//
//  ViewController.swift
//  Instafilter
//
//  Created by Neil Hiddink on 8/22/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    var currentImage: UIImage!
    
    // MARK: IB Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
    }
    
    // MARK: Helper Methods
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    // MARK: IB Actions
    
    @IBAction func changeFilterButtonPressed(_ sender: UIButton) {
    
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func intensityChanged(_ sender: UISlider) {
        
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        dismiss(animated: true, completion: nil)
        currentImage = image
    }
}

