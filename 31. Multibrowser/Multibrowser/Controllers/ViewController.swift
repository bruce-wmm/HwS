//
//  ViewController.swift
//  Multibrowser
//
//  Created by Neil Hiddink on 10/29/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import WebKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    //MARK: - Properties
    
    weak var activeWebView: WKWebView?
    
    //MARK: - IB Outlets
    
    @IBOutlet var addressBar: UITextField!
    @IBOutlet var stackView: UIStackView!
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDefaultTitle()
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWebView))
        let delete = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteWebView))
        navigationItem.rightBarButtonItems = [delete, add]
    }
    
    //MARK: - Helper Methods
    
    func setDefaultTitle() {
        title = "Multibrowser"
    }
    
    @objc func addWebView() {
        let webView = WKWebView()
        webView.navigationDelegate = self
        
        stackView.addArrangedSubview(webView)
        let url = URL(string: "https://www.hackingwithswift.com/")!
        webView.load(URLRequest(url: url))
        
        webView.layer.borderColor = UIColor.blue.cgColor
        selectWebView(webView)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(webViewTapped))
        recognizer.delegate = self
        webView.addGestureRecognizer(recognizer)
    }
    
    @objc func deleteWebView() {
        
    }
    
    func selectWebView(_ webView: WKWebView) {
        for view in stackView.arrangedSubviews {
            view.layer.borderWidth = 0
        }
        
        activeWebView = webView
        webView.layer.borderWidth = 3
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let webView = activeWebView, let address = addressBar.text {
            if let url = URL(string: address) {
                webView.load(URLRequest(url: url))
            }
        }
        textField.resignFirstResponder()
        return true
    }
    
    @objc func webViewTapped(_ recognizer: UITapGestureRecognizer) {
        if let selected = recognizer.view as? WKWebView {
            selectWebView(selected)
        }
    }
    
}

//MARK: - ViewController: WKNavigationDelegate

extension ViewController: WKNavigationDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

//MARK: - ViewController: UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
}

//MARK: - ViewController: UIGestureRecognizerDelegate

extension ViewController: UIGestureRecognizerDelegate {
    
}
