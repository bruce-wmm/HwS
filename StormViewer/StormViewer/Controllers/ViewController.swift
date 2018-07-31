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

        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        print(pictures)
        
    }
    
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
        return cell
    }
    
}

