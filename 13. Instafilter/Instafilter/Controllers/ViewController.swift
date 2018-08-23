//
//  ViewController.swift
//  Instafilter
//
//  Created by Neil Hiddink on 8/22/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import CoreImage

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    var currentImage: UIImage!
    var context: CIContext!
    var currentFilter: CIFilter!
    
    // MARK: IB Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
    }
    
    // MARK: Helper Methods
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(slider.value, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(slider.value * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(slider.value * 10, forKey: kCIInputScaleKey)
        }
        if inputKeys.contains(kCIInputCenterKey) {
            currentFilter.setValue(CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2), forKey: kCIInputCenterKey)
        }
        if let cgimg = context.createCGImage(currentFilter.outputImage!, from: currentFilter.outputImage!.extent) {
            let processedImage = UIImage(cgImage: cgimg)
            self.imageView.image = processedImage
        }
        
    }
    
    func setFilter(action: UIAlertAction) {
        guard currentImage != nil else { return }
        currentFilter = CIFilter(name: action.title!)
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }

    // MARK: IB Actions
    
    @IBAction func changeFilterButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose filter", message:
            nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "CIBumpDistortion",
                                   style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CIGaussianBlur",
                                   style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CIPixellate",
                                   style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CISepiaTone",
                                   style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CITwirlDistortion",
                                   style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CIUnsharpMask",
                                   style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CIVignette",
                                   style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func intensityChanged(_ sender: UISlider) {
        applyProcessing()
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        dismiss(animated: true, completion: nil)
        currentImage = image
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        applyProcessing()
    }
}

