//
//  GradientView.swift
//  PsychicTester
//
//  Created by Neil Hiddink on 11/30/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - GradientView: UIView

@IBDesignable class GradientView: UIView {

    // MARK: - Properties
    
    @IBInspectable var topColor: UIColor = UIColor.white
    @IBInspectable var bottomColor: UIColor = UIColor.black
    
    // MARK: - Layout Methods
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }
}
