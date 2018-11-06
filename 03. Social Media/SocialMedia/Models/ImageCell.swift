//
//  ImageCell.swift
//  SocialMedia
//
//  Created by Neil Hiddink on 7/31/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
