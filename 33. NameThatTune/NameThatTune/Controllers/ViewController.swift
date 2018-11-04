//
//  ViewController.swift
//  NameThatTune
//
//  Created by Neil Hiddink on 11/1/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import CloudKit

// MARK: - ViewController: UITableViewController

class ViewController: UITableViewController {

    // MARK: - Properties
    
    static var isDirty = true
    var tunes = [Tune]()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Name that Tune"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTune))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        if ViewController.isDirty {
            loadTunes()
        }
    }
    
    // MARK: - Helper Methods
    
    @objc func addTune() {
        let recordVC = RecordTuneViewController()
        navigationController?.pushViewController(recordVC, animated: true)
    }

    func loadTunes() {
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        let query = CKQuery(recordType: "Tunes", predicate: pred)
        query.sortDescriptors = [sort]
        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["genre", "comments"]
        operation.resultsLimit = 50
        var newTunes = [Tune]()
        
        operation.recordFetchedBlock = { record in
            let tune = Tune()
            tune.recordID = record.recordID
            tune.genre = record["genre"]
            tune.comments = record["comments"]
            newTunes.append(tune)
        }
        
        operation.queryCompletionBlock = { [unowned self] (cursor,
            error) in
            DispatchQueue.main.async {
                if error == nil {
                    ViewController.isDirty = false
                    self.tunes = newTunes
                    self.tableView.reloadData()
                } else {
                    let alert = UIAlertController(title: "Fetch failed",
                                                  message: "There was a problem fetching the list of tunes; please try again: \(error!.localizedDescription)",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)
    }
    
    func makeAttributedString(title: String, subtitle: String) -> NSAttributedString {
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline),
                               NSAttributedString.Key.foregroundColor: UIColor.red]
        let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]
        let titleString = NSMutableAttributedString(string: "\(title)", attributes: titleAttributes)
        
        if subtitle.count > 0 {
            let subtitleString = NSAttributedString(string: "\n\(subtitle)", attributes: subtitleAttributes)
            titleString.append(subtitleString)
        }
        
        return titleString
    }

    // MARK: - UITableView Delegate and Data Source Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultsVC = ResultsViewController()
        resultsVC.tune = tunes[indexPath.row]
        navigationController?.pushViewController(resultsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tunes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.attributedText = makeAttributedString(title: tunes[indexPath.row].genre, subtitle: tunes[indexPath.row].comments)
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
}
