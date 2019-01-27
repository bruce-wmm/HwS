//
//  ViewController.swift
//  NetworkingWithJSON
//
//  Created by Neil Hiddink on 1/27/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var friends = [Friend]()
    var filteredFriends = [Friend]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let search = UISearchController(searchResultsController: nil) // nil means I intend to show the results of my controller in the current controller
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Find a friend"
        search.searchResultsUpdater = (self as! UISearchResultsUpdating)
        navigationItem.searchController = search
        
        DispatchQueue.global().async {
            do {
                let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let downloadedFriends = try decoder.decode([Friend].self, from: data)
                
                DispatchQueue.main.async {
                    self.friends = downloadedFriends
                    self.filteredFriends = downloadedFriends
                    self.tableView.reloadData()
                }
            } catch {
                print("Unable to convert data.")
            }
        }
    }
    
    // MARK: Helper Methods
    
    func updateSearchResults(for searchController: UISearchController) {
//        if let text = searchController.searchBar.text, text.count > 0 {
//            filteredFriends = friends.filter {
//                $0.name.contains(text)
//                || $0.company.contains(text)
//                || $0.address.contains(text)
//            }
//        } else {
//            filteredFriends = friends
//        }
        filteredFriends = friends.matching(searchController.searchBar.text)
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let friend = filteredFriends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.friends.map { $0.name }.joined(separator: ",")
        return cell
    }
    
}

