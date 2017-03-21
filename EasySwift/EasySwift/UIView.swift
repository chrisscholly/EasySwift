//
//  UIView.swift
//  EasySwift
//
//  Created by Sabbe on 21/03/17.
//  Copyright © 2017 sabbe.kev. All rights reserved.
//

import UIKit

// MARK: - Methods -

func alignOnY(views: [UIView], spacing: CGFloat, x: CGFloat, superView: UIView)
{
    var height: CGFloat = 0
    
    for view in views { height += view.frame.height }
    height += (spacing * CGFloat(views.count - 1))
    
    print(height)
    
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

// MARK: - Extensions -

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
}
