//
//  ViewController.swift
//  StormViewer
//
//  Created by Neil Hiddink on 7/31/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: ViewController: UIViewController

class ViewController: UICollectionViewController {

    // MARK: Properties
    
    var pictures = [String]()
        
    // MARK: View Life Cycle
    
    override func viewDidLoad() {        
        super.viewDidLoad()

        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource

extension ViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.selectedImage = pictures[indexPath.item]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.cellImageView?.image = UIImage(named: pictures[indexPath.item])
        cell.titleLabel.text = "Picture \(indexPath.item)"
        cell.descriptionLabel.text = pictures[indexPath.item]
        return cell
    }
    
}

