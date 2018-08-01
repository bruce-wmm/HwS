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
    }

}

extension ViewController: WKNavigationDelegate {}

