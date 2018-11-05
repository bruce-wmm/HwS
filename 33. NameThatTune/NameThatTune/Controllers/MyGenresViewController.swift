//
//  MyGenresViewController.swift
//  NameThatTune
//
//  Created by Neil Hiddink on 11/4/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import CloudKit

// MARK: - MyGenresViewController: UITableViewController

class MyGenresViewController: UITableViewController {

    // MARK: - Properties
    
    var myGenres: [String]!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let savedGenres = UserDefaults.standard.object(forKey: "myGenres") as? [String] {
            myGenres = savedGenres
        } else {
            myGenres = [String]()
        }
        title = "Notify me about..."
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Helper Methods
    
    @objc func saveTapped() {
        UserDefaults.standard.set(myGenres, forKey: "myGenres")
        let database = CKContainer.default().publicCloudDatabase
        database.fetchAllSubscriptions { [unowned self]
            subscriptions, error in
            if error == nil {
                if let subscriptions = subscriptions {
                    for subscription in subscriptions {
                        database.delete(withSubscriptionID:
                        subscription.subscriptionID) { str, error in
                            if error != nil {
                                print(error!.localizedDescription)
                            }
                        } }
                    for genre in self.myGenres {
                        let predicate = NSPredicate(format:"genre = %@", genre)
                        let subscription = CKQuerySubscription(recordType: "Tunes", predicate: predicate, options: .firesOnRecordCreation)
                        let notification = CKSubscription.NotificationInfo()
                        notification.alertBody = "There's a new tune in the \(genre) genre."
                        notification.soundName = "default"
                        subscription.notificationInfo = notification
                        database.save(subscription) { result, error in
                            if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            } else {
                print(error!.localizedDescription)
            }
        }
    }

    // MARK: - UITableView Delegate and Data Source
    
    // MARK: Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let selectedGenre = SelectGenreViewController.genres[indexPath.row]
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                myGenres.append(selectedGenre)
            } else {
                cell.accessoryType = .none
                if let index = myGenres.index(of: selectedGenre) {
                    myGenres.remove(at: index)
                }
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // MARK: Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SelectGenreViewController.genres.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let genre = SelectGenreViewController.genres[indexPath.row]
        cell.textLabel?.text = genre
        if myGenres.contains(genre) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }

}
