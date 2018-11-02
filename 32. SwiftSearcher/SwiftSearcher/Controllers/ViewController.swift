//
//  ViewController.swift
//  SwiftSearcher
//
//  Created by Neil Hiddink on 10/30/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    var projects = [[String]]()
    
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showProject(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.attributedText = makeAttributedString(title: projects[indexPath.row][0], subtitle: projects[indexPath.row][1])
        return cell
    }

}
