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
    var progressView: UIProgressView!
    
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
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
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
    
    // MARK: KVO
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
}

// MARK: ViewController: WKNavigationDelegate

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
}

