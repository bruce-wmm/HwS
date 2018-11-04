//
//  ResultsViewController.swift
//  NameThatTune
//
//  Created by Neil Hiddink on 11/3/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import AVFoundation
import CloudKit

// MARK: - ResultsViewController: UITableViewController

class ResultsViewController: UITableViewController {

    // MARK: - Properties
    
    var tune: Tune!
    var suggestions = [String]()
    
    var tunePlayer: AVAudioPlayer!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Genre: \(tune.genre!)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Download",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(downloadTapped))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let reference = CKRecord.Reference(recordID: tune.recordID, action: .deleteSelf)
        let pred = NSPredicate(format: "owningTune == %@", reference)
        let sort = NSSortDescriptor(key: "creationDate", ascending: true)
        let query = CKQuery(recordType: "Suggestions", predicate: pred)
        query.sortDescriptors = [sort]
        CKContainer.default().publicCloudDatabase.perform(query,
                                                          inZoneWith: nil) { [unowned self] results, error in
                                                            if let error = error {
                                                                print(error.localizedDescription)
                                                            } else {
                                                                if let results = results {
                                                                    self.parseResults(records: results)
                                                                }
                                                            }
                                                          }
    }
    // MARK: - Helper Methods
    
    func add(suggestion: String) {
        let tuneRecord = CKRecord(recordType: "Suggestions")
        let reference = CKRecord.Reference(recordID: tune.recordID, action: .deleteSelf)
        tuneRecord["text"] = suggestion as CKRecordValue
        tuneRecord["owningTune"] = reference as CKRecordValue
        
        CKContainer.default().publicCloudDatabase.save(tuneRecord) { [unowned self] record, error in
            DispatchQueue.main.async {
                if error == nil {
                    self.suggestions.append(suggestion)
                    self.tableView.reloadData()
                } else {
                    let alert = UIAlertController(title: "Error",
                                                  message: "There was a problem submitting your suggestion: \(error!.localizedDescription)",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
    }
        
    @objc func downloadTapped() {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.tintColor = UIColor.black
        spinner.startAnimating()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: spinner)
        CKContainer.default().publicCloudDatabase.fetch(withRecordID: tune.recordID) { [unowned self] record, error in
            if let error = error {
                DispatchQueue.main.async {
                    print("Error fetching tune: \(error.localizedDescription)")
                    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Download",
                                                                             style: .plain,
                                                                             target: self,
                                                                             action: #selector(self.downloadTapped))
                }
            } else {
                if let record = record {
                    if let asset = record["audio"] as? CKAsset {
                        self.tune.audio = asset.fileURL
                        DispatchQueue.main.async {
                            self.navigationItem.rightBarButtonItem =
                                UIBarButtonItem(title: "Listen",
                                                style: .plain,
                                                target: self,
                                                action: #selector(self.listenTapped))
                        }
                    }
                }
            }
        }
    }
    
    func parseResults(records: [CKRecord]) {
        var newSuggestions = [String]()
        for record in records {
            newSuggestions.append(record["text"] as! String)
        }
        DispatchQueue.main.async { [unowned self] in
            self.suggestions = newSuggestions
            self.tableView.reloadData()
        }
    }
        
    @objc func listenTapped() {
        do {
            tunePlayer = try AVAudioPlayer(contentsOf: tune.audio)
            tunePlayer.play()
        } catch {
            let alert = UIAlertController(title: "Playback failed",
                                       message: "There was a problem playing your tune; please try re-recording.",
                                       preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
        }
    }
    
    // MARK: - UITableView Delegate and Data Source Methods
    
    // MARK: Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 && indexPath.row == suggestions.count else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "Suggest a song...", message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Submit", style: .default) { [unowned self, alert] action in
            if let textField = alert.textFields?[0] {
                if textField.text!.count > 0 {
                    self.add(suggestion: textField.text!)
                }
            }
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    // MARK: Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return suggestions.count + 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        if indexPath.section == 0 {
            // the user's comments about this tune
            cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
            if tune.comments.count == 0 {
                cell.textLabel?.text = "Comments: None"
            } else {
                cell.textLabel?.text = tune.comments
            }
        } else {
            cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
            if indexPath.row == suggestions.count {
                // this is our extra row
                cell.textLabel?.text = "Add suggestion"
                cell.selectionStyle = .gray
            } else {
                cell.textLabel?.text = suggestions[indexPath.row]
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Suggested songs"
        }
        return nil
    }
    
}
