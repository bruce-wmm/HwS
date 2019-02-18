//
//  ViewController.swift
//  StormViewer
//
//  Created by Neil Hiddink on 7/31/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: ViewController: UIViewController

class ViewController: UITableViewController {

    // MARK: Properties
    
    var pictures = [String]()
        
    // MARK: View Life Cycle
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fileManager = FileManager.default
        guard let path = Bundle.main.resourcePath,
              let items = try? fileManager.contentsOfDirectory(atPath: path) else { return }
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.selectedImage = pictures[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.cellImageView?.image = UIImage(named: pictures[indexPath.row])
        cell.titleLabel.text = "Picture \(indexPath.row)"
        cell.descriptionLabel.text = pictures[indexPath.row]
        cell.cellImageView.layer.masksToBounds = true
        cell.cellImageView.layer.cornerRadius = cell.cellImageView.frame.width / 2.0
        return cell
    }
    
}

