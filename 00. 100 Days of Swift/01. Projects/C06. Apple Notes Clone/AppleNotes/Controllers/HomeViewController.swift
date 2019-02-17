//
//  HomeViewController.swift
//  AppleNotes
//
//  Created by Neil Hiddink on 9/18/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: IB Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IB Actions
    
    @IBAction func editDoneButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func newFolderButtonPressed(_ sender: UIButton) {
        
    }
   
}

// MARK: HomeViewController: UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Implement transition to individual folder
    }
    
    // MARK: Data Source
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "ICLOUD"
        }
        return nil
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteCell
        cell.textLabel?.text = "Note"
        cell.detailTextLabel?.text = "100"
        return cell
    }
}
