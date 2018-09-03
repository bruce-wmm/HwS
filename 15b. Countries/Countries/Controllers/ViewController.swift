//
//  ViewController.swift
//  Countries
//
//  Created by Neil Hiddink on 9/2/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    var countries = [Country(name: "United States of America",
                             capital: "Washington, D.C.",
                             population: 380000000,
                             currency: "Dollar")]
    
    // MARK: IB Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: 

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        present(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as! CountryCell
        cell.countryImageView.image = UIImage(named: "united-states-of-america")
        cell.countryTitle.text = countries[indexPath.row].name
        cell.countrySubtitle.text = countries[indexPath.row].capital
        
        return cell
    }
}
