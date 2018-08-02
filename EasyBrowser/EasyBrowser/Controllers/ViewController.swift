//
//  ViewController.swift
//  EasyBrowser
//
//  Created by Neil Hiddink on 8/1/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import WebKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    var webView: WKWebView!
    
    // MARK: View Life Cycle
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.apple.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
    }

    
    // MARK: Helper Methods
    
    @objc func openTapped() {
        let alert = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        alert.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(alert, animated: true)
    }
    
    @objc func openPage(action: UIAlertAction) {
        if let url = URL(string: "https://" + action.title!) {
            webView.load(URLRequest(url: url))
        }
    }
}

// MARK: ViewController: WKNavigationDelegate

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
}

