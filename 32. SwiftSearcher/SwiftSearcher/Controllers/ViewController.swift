//
//  ViewController.swift
//  SwiftSearcher
//
//  Created by Neil Hiddink on 10/30/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import SafariServices
import CoreSpotlight
import MobileCoreServices

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var projects = [[String]]()
    var favorites = [Int]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projects.append(["Project 1: Storm Viewer", "Constants and variables, UITableView, UIImageView, FileManager, storyboards"])
        projects.append(["Project 2: Guess the Flag", "@2x and @3x images, asset catalogs, integers, doubles, floats, operators (+= and -=), UIButton, enums, CALayer, UIColor, random numbers, actions, string interpolation, UIAlertController"])
        projects.append(["Project 3: Social Media", "UIBarButtonItem, UIActivityViewController, the Social framework, URL"])
        projects.append(["Project 4: Easy Browser", "loadView(), WKWebView, delegation, classes and structs, URLRequest, UIToolbar, UIProgressView., key-value observing"])
        projects.append(["Project 5: Word Scramble", "Closures, method return values, booleans, NSRange"])
        projects.append(["Project 6: Auto Layout", "Get to grips with Auto Layout using practical examples and code"])
        projects.append(["Project 7: Whitehouse Petitions", "JSON, Data, UITabBarController"])
        projects.append(["Project 8: 7 Swifty Words", "addTarget(), enumerated(), count, index(of:), property observers, range operators."])
        
        if let savedFavorites = UserDefaults.standard.object(forKey: "favorites") as? [Int] {
            favorites = savedFavorites
        }
        tableView.isEditing = true
        tableView.allowsSelectionDuringEditing = true
    }
    
    // MARK: - Helper Methods

    func makeAttributedString(title: String, subtitle: String) -> NSAttributedString {
            let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline),
                                   NSAttributedString.Key.foregroundColor: UIColor.red]
            let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]
            let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
            let subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)
            titleString.append(subtitleString)
            return titleString
    }
    
    func showProject(_ number: Int) {
        if let url = URL(string: "https://www.hackingwithswift.com/read/\(number + 1)") {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
}
    
}

// MARK: - ViewController: UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showProject(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if favorites.contains(indexPath.row) {
            return .delete
        } else {
            return .insert
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            favorites.append(indexPath.row)
            index(item: indexPath.row)
        } else {
            if let index = favorites.index(of: indexPath.row) {
                favorites.remove(at: index)
                deindex(item: indexPath.row)
            }
        }
        UserDefaults.standard.set(favorites, forKey: "favorites")
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func index(item: Int) {
        let project = projects[item]
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        attributeSet.title = project[0]
        attributeSet.contentDescription = project[1]
        let item = CSSearchableItem(uniqueIdentifier: "\(item)", domainIdentifier: "com.hackingwithswift", attributeSet: attributeSet)
        item.expirationDate = Date.distantFuture // i.e. never expires
        CSSearchableIndex.default().indexSearchableItems([item]) { error in
            if let error = error {
                print("Indexing error: \(error.localizedDescription)")
            } else {
                print("Search item successfully indexed!")
            }
        }
    }
    
    func deindex(item: Int) {
        CSSearchableIndex.default().deleteSearchableItems(withIdentifiers: ["\(item)"]) { error in
            if let error = error {
                print("Deindexing error: \(error.localizedDescription)")
            } else {
                print("Search item successfully removed!")
            }
        }
    }
    
    // MARK: Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.attributedText = makeAttributedString(title: projects[indexPath.row][0], subtitle: projects[indexPath.row][1])
        
        if favorites.contains(indexPath.row) {
            cell.editingAccessoryType = .checkmark
        } else {
            cell.editingAccessoryType = .none
        }
        
        return cell
    }

}
