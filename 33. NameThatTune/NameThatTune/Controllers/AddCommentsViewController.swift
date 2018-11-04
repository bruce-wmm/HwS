//
//  AddCommentsViewController.swift
//  NameThatTune
//
//  Created by Neil Hiddink on 11/2/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - AddCommentsViewController: UIViewController

class AddCommentsViewController: UIViewController {

    // MARK: - Properties
    
    var genre: String!
    var comments: UITextView!
    let placeholder = "If you have any additional comments that might help identify your tune, enter them here."
    
    // MARK: - View Life Cycle
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        comments = UITextView()
        comments.translatesAutoresizingMaskIntoConstraints = false
        comments.delegate = self
        comments.font = UIFont.preferredFont(forTextStyle: .body)
        view.addSubview(comments)
        
        comments.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        comments.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        comments.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        comments.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitTapped))
        comments.text = placeholder
    }
    
    // MARK: - Helper Methods

    @objc func submitTapped() {
        let submitVC = SubmitViewController()
        submitVC.genre = genre
        if comments.text == placeholder {
            submitVC.comments = ""
        } else {
            submitVC.comments = comments.text
        }
        navigationController?.pushViewController(submitVC, animated: true)
    }
    
}

// MARK: - AddCommentsViewController: UITextViewDelegate

extension AddCommentsViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholder {
            textView.text = ""
        }
    }
}
