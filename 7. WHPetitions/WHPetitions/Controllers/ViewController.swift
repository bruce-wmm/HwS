//
//  ViewController.swift
//  WHPetitions
//
//  Created by Neil Hiddink on 8/3/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    var petitions = [[String: String]]()
    
    // MARK: IB Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getPetitionsFor(url: "https://api.whitehouse.gov/v1/petitions.json?limit=100")
    }
    
    // MARK: Helper Methods
    
    func getPetitionsFor(url: String) {
        if let url = URL(string: url) {
            if let data = try? String(contentsOf: url) {
                let json = JSON(parseJSON: data)
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    parse(json: json)
                }
            }
        }
    }
    
    func parse(json: JSON) {
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            petitions.append(obj)
        }
        
        tableView.reloadData()
    }
}

// MARK: ViewController: UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.detailPetition = petitions[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition["title"]
        cell.detailTextLabel?.text = petition["body"]
        return cell
    }
}
