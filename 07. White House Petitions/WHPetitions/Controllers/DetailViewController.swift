//
//  DetailViewController.swift
//  WHPetitions
//
//  Created by Neil Hiddink on 8/4/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import WebKit

// MARK: DetailViewController: UIViewController

class DetailViewController: UIViewController {
    
    // MARK: Properties
    
    var webView: WKWebView!
    var detailPetition: [String: String]!
    
    // MARK:
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard detailPetition != nil else { return }
        
        if let body = detailPetition["body"] {
            var html = "<html>"
            html += "<head>"
            html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
            html += "<style> body { font-size: 150%; } </style>"
            html += "</head>"
            html += "<body>"
            html += body
            html += "</body>"
            html += "</html>"
            webView.loadHTMLString(html, baseURL: nil)
        }
    }
    
}
