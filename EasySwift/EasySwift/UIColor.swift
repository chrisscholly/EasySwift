//
//  UIColor.swift
//  EasySwift
//
//  Created by Sabbe on 21/03/17.
//  Copyright © 2017 sabbe.kev. All rights reserved.
//

import UIKit

// MARK: - Methods -

// MARK: - Extensions -

extension UIColor
{
    // MARK: - Init
    
    convenience init(r: Int, g: Int, b: Int)
    {
        assert(r >= 0 && r <= 255, "Invalid red component")
        assert(g >= 0 && g <= 255, "Invalid green component")
        assert(b >= 0 && b <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(r) / 255.0,
                  green: CGFloat(g) / 255.0,
                  blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
    convenience init(r: Int, g: Int, b: Int, alpha: CGFloat)
    {
        assert(r >= 0 && r <= 255, "Invalid red component")
        assert(g >= 0 && g <= 255, "Invalid green component")
        assert(b >= 0 && b <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(r) / 255.0,
                  green: CGFloat(g) / 255.0,
                  blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    convenience init(hex: Int) {
        self.init(r:(hex >> 16) & 0xff, g:(hex >> 8) & 0xff, b:hex & 0xff)
    }
    
    convenience init(hex: Int, alpha: CGFloat) {
        self.init(r:(hex >> 16) & 0xff, g:(hex >> 8) & 0xff, b:hex & 0xff, alpha: alpha)
    }
}

