//
//  UIButton.swift
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

// MARK: - Extensions -

extension UIButton
{
    // MARK: - Button with Text title
    
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat,
                     titleColor: UIColor?, bgColor: UIColor?,
                     title: String?, alignment: UIControlContentHorizontalAlignment?,
                     selector: Selector?, superView: UIView?)
    {
        self.init()
        
        self.frame = CGRect(x: x, y: y, w: w, h: h)
        
        if titleColor != nil {
            self.setTitleColor(titleColor, for: .normal) }
        
        if bgColor != nil {
            self.backgroundColor = bgColor }
        
        if title != nil {
            self.setTitle(title, for: .normal) }
        
        if alignment != nil {
            self.contentHorizontalAlignment = alignment! }
        
        if selector != nil {
            self.addTarget(nil, action: selector!, for: .touchUpInside) }
        
        if superView != nil {
            superView!.addSubview(self)
        }
    }
    
    // MARK: - Button with Image
    
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat,
                     bgColor: UIColor?, image: UIImage?, contentMode: UIViewContentMode?,
                     insets: UIEdgeInsets?, selector: Selector?, superView: UIView?)
    {
        self.init()
        
        self.frame = CGRect(x: x, y: y, w: w, h: h)
        
        if image != nil {
            self.setImage(image!, for: .normal)
        }
        
        if contentMode != nil {
            self.contentMode = contentMode!
        }
        
        if insets != nil {
            self.imageEdgeInsets = insets!
        }
        
        if selector != nil {
            self.addTarget(nil, action: selector!, for: .touchUpInside) }
        
        if superView != nil {
            superView!.addSubview(self)
        }
    }

    // MARK: - Properties
        
    func setProperties(text: String, size: CGFloat, color: UIColor?)
    {
        self.setTitle(text, for: .normal)
        self.titleLabel!.font = UIFont(name: self.titleLabel!.font.fontName, size: size)
        color != nil ? self.setTitleColor(color, for: .normal) : ()
    }
    
    func setAction(action: Selector, tag: Int?)
    {
        self.addTarget(nil, action: action, for: .touchUpInside)
        if tag != nil { self.tag = tag! }
    }
}
