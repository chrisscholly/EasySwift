//
//  UILabel.swift
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

extension UILabel
{
    // Init
    convenience init(text: String, x: CGFloat, y: CGFloat,
                     width: CGFloat, height: CGFloat,
                     fontSize: CGFloat, align: NSTextAlignment,
                     superView: UIView?)
    {
        self.init()
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        self.text = text
        self.font = UIFont(name: self.font.fontName, size: fontSize)
        self.textAlignment = align
        
        (superView != nil) ? (superView!.addSubview(self)) : ()
    }
    
    convenience init(text: String, x: CGFloat, y: CGFloat,
                     width: CGFloat, height: CGFloat, textColor: UIColor,
                     fontSize: CGFloat, align: NSTextAlignment,
                     superView: UIView?)
    {
        self.init()
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        self.text = text
        self.textColor = textColor
        self.font = UIFont(name: self.font.fontName, size: fontSize)
        self.textAlignment = align
        
        (superView != nil) ? (superView!.addSubview(self)) : ()
    }
    
    // Setters
    func setFontSize(size: Double) {
        self.font =  UIFont(name: self.font.fontName, size: CGFloat(size))!
    }
    
    func setLineHeight(lineHeight: CGFloat)
    {
        let text = self.text
        if let text = text {
            
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSParagraphStyleAttributeName,
                                         value: style,
                                         range: NSMakeRange(0, text.characters.count))
            
            self.attributedText = attributeString
        }
    }
    
    func setLineHeight(_ lineHeight: CGFloat, _ textAlignment: NSTextAlignment, _ font: UIFont)
    {
        let text = self.text
        if let text = text {
            
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSParagraphStyleAttributeName,
                                         value: style,
                                         range: NSMakeRange(0, text.characters.count))
            
            self.attributedText = attributeString
            self.textAlignment = textAlignment
            self.font = font
        }
    }
    
    func setTextProperties(text: String, size: CGFloat, color: UIColor?, align: NSTextAlignment?)
    {
        self.text = text
        self.font = UIFont(name: self.font.fontName, size: size)
        
        color != nil ? self.textColor = color! : ()
        align != nil ? self.textAlignment = align! : ()
    }

}
