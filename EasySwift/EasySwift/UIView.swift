//
//  UIView.swift
//  EasySwift
//
//  Created by Sabbe on 21/03/17.
//  Copyright © 2017 sabbe.kev. All rights reserved.
//

//  MIT License
//
//  Copyright (c) 2017 sabbek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

// =================
// MARK: - Methods -
// =================

// MARK: - Align list of UIView on X or Y with spacing

func alignOnY(views: [UIView], spacing: CGFloat, x: CGFloat, superView: UIView)
{
    var height: CGFloat = 0
    
    for view in views { height += view.frame.height }
    height += (spacing * CGFloat(views.count - 1))
    
    var y = superView.frame.height / 2 - height / 2
    
    for view in views {
        view.frame = CGRect(x: x, y: y, width: view.frame.width, height: view.frame.height)
        y += view.frame.height + spacing
    }
}

func alignOnX(views: [UIView], spacing: CGFloat, y: CGFloat, superView: UIView)
{
    var width: CGFloat = 0
    
    for view in views { width += view.frame.width }
    width += (spacing * CGFloat(views.count - 1))
    
    var x = superView.frame.width / 2 - width / 2
    for view in views {
        view.frame = CGRect(x: x, y: y, width: view.frame.width, height: view.frame.height)
        x += view.frame.width + spacing
    }
}

// ====================
// MARK: - Extensions -
// ====================

extension UIView
{
    // MARK: - inits
    
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, superView: UIView?)
    {
        self.init()
        
        self.frame = CGRect(x: x, y: y, width: w, height: h)
        
        if (superView != nil) {
            superView!.addSubview(self)
        }
    }
    
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, bgColor: UIColor?, superView: UIView?)
    {
        self.init()
        
        self.frame = CGRect(x: x, y: y, width: w, height: h)
        
        bgColor     != nil ? self.backgroundColor = bgColor! : ()
        superView   != nil ? superView!.addSubview(self) : ()
    }
    
    // MARK: - getters / setters
    
    var x: CGFloat {
        get { return self.frame.origin.x }
        
        set(x) { self.frame = CGRect(
            x: x, y: self.frame.origin.y,
            width: self.frame.width, height: self.frame.height) }
    }
    
    var y: CGFloat {
        get { return self.frame.origin.y }
        
        set(y) { self.frame = CGRect(
            x: self.frame.origin.x, y: y,
            width: self.frame.width, height: self.frame.height) }
    }
    
    var h: CGFloat {
        get { return self.frame.height }
        
        set(h) { self.frame = CGRect(
            x: self.frame.origin.x, y: self.frame.origin.y,
            width: self.frame.width, height: h) }
    }
    
    var w: CGFloat {
        get { return self.frame.width }
        
        set(w) { self.frame = CGRect(
            x: self.frame.origin.x, y: self.frame.origin.y,
            width: w, height: self.frame.height) }
    }
    
    // MARK: - customization
    
    func rounded()
    {
        self.layer.cornerRadius     = self.frame.width / 2
        self.layer.masksToBounds    = true
    }
    
    func borded(color: UIColor?)
    {
        self.layer.borderWidth      = 1
        
        self.layer.borderColor = color != nil
            ? color!.cgColor : UIColor.black.cgColor
    }
    
    // MARK: - Alignment
    
    func centeredInSuperView()
    {
        if let superView = self.superview {
            self.frame = CGRect(x: superView.w / 2 - w / 2 ,
                y: superView.h / 2 - h / 2, width: w, height: h)
        }
    }
    
    func centeredXSuperView()
    {
        if let superView = self.superview {
            self.frame = CGRect(x: superView.w / 2 - w / 2,
                y: y, width: w, height: h)
        }
    }
    
    func centeredYSuperView()
    {
        if let superView = self.superview {
            self.frame = CGRect(x: x, y: superView.h / 2 - h / 2,
                width: w, height: h)
        }
    }
}
