//
//  ActionViewController.swift
//  Extension
//
//  Created by Neil Hiddink on 9/6/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import MobileCoreServices

// MARK: ActionViewController: UIViewController

class ActionViewController: UIViewController {

    // MARK: Properties
    
    var pageTitle = ""
    var pageURL = ""
    
    // MARK: IB Outlets
    
    @IBOutlet weak var script: UITextView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
        if let inputItem = extensionContext!.inputItems.first as? NSExtensionItem {
            if let itemProvider = inputItem.attachments?.first as? NSItemProvider {
                itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String) { [unowned self] (dict, error) in
                    let itemDictionary = dict as! NSDictionary
                    let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as! NSDictionary
                    // print(javaScriptValues)
                    self.pageTitle = javaScriptValues["title"] as! String
                    self.pageURL = javaScriptValues["URL"] as! String
                    DispatchQueue.main.async {
                        self.title = self.pageTitle
                    }
                }
            }
        }

    }
    
    // MARK: IB Actions

    @IBAction func done() {
        let item = NSExtensionItem()
        let argument: NSDictionary = ["customJavaScript": script.text]
        let webDictionary: NSDictionary = [NSExtensionJavaScriptFinalizeArgumentKey: argument]
        let customJavaScript = NSItemProvider(item: webDictionary, typeIdentifier: kUTTypePropertyList as String)
        item.attachments = [customJavaScript]
        extensionContext!.completeRequest(returningItems: [item])
    }

}
