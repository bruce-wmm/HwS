//
//  Helper.swift
//  ExplodingMonkeys
//
//  Created by Neil Hiddink on 10/27/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import Foundation
import UIKit

struct PhysicsCategory {
    static let None: UInt32 = 0b0 // 0
    static let Player: UInt32 = 0b1 // 1
    static let Banana: UInt32 = 0b10 // 2
    static let Building: UInt32 = 0b10 // 4
}

func deg2rad(degrees: Int) -> Double {
    return Double(degrees) * Double.pi / 180.0
}

func RandomInt(min: Int, max: Int) -> Int {
	if max < min { return min }
	return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
}

func RandomFloat() -> Float {
	return Float(arc4random()) /  Float(UInt32.max)
}

func RandomFloat(min: Float, max: Float) -> Float {
	return (Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
}

func RandomDouble(min: Double, max: Double) -> Double {
	return (Double(arc4random()) / Double(UInt32.max)) * (max - min) + min
}

func RandomCGFloat() -> CGFloat {
	return CGFloat(RandomFloat())
}

func RandomColor() -> UIColor {
	return UIColor(red: RandomCGFloat(), green: RandomCGFloat(), blue: RandomCGFloat(), alpha: 1)
}
