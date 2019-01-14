//
//  ViewController.swift
//  TimeZones
//
//  Created by Neil Hiddink on 1/13/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    weak var delegate: ViewController?

    var friends = [Friend]()
    var selectedFriend: Int? = nil
    
    // MARK: IB Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        title = "Time Zones"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFriend))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    // MARK: Helper Methods
    
    func loadData() {
        let defaults = UserDefaults.standard
        
        guard let savedData = defaults.data(forKey: "Friends") else {
            fatalError("Couldn't find the data.")
        }
        
        let decoder = JSONDecoder()
        
        guard let savedFriends = try? decoder.decode([Friend].self, from: savedData) else {
            return
        }
        
        friends = savedFriends
    }
    
    func saveData() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        
        guard let savedData = try? encoder.encode(friends) else {
            fatalError("Unable to encode friends data.")
        }
        
        defaults.set(savedData, forKey: "Friends")
    }

    @objc func addFriend() {
        let friend = Friend()
        friends.append(friend)
        tableView.insertRows(at: [IndexPath(row: friends.count - 1, section: 0)], with: .automatic)
        saveData()
        
        configure(friend: friend, position: friends.count - 1)
    }
    
    func configure(friend: Friend, position: Int) {
        guard let friendVC = storyboard?.instantiateViewController(withIdentifier: "FriendViewController") as? FriendViewController else {
            fatalError("Unable to create FriendViewController.")
        }
        
        friendVC.delegate = self
        friendVC.friend = friend
        navigationController?.pushViewController(friendVC, animated: true)
    }
    
    func updateFriend(friend: Friend) {
        guard let selectedFriends = selectedFriend else { return }
        
        friends[selectedFriend] = friend
        tableView.reloadData()
        saveData()
    }
}

// MARK: - UIViewController: UITableViewDelegate, UITableViewDataSource

extension UIViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Delegate
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        configure(friend: friends[indexPath.row], position: indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let friend = friends[indexPath.row]
        cell.textLabel?.text = "\(friend.name)"
        cell.detailTextLabel?.text = "\(friend.timeZome.identifier)"
        return cell
    }
    
}

