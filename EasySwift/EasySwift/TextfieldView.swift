//
//  TextfieldView.swift
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

class TextfieldView: UIView
{
    var textfield       : UITextField!
    var separatorBar    : UIView!
    var imageView       : UIImageView!
    
    var isEmpty         = true
    var popLabel        : UILabel!
    
    convenience init(frame: CGRect, placeHolder: String, image: UIImage?, color: UIColor,
        popLabelColor: UIColor, placeHolderColor: UIColor, separatorColor: UIColor, sView: UIView?)
    {
        self.init() ; self.frame = frame
        
        self.separatorBar
            = UIView(x: 0, y: h - 1, w: w, h: 1, bgColor: separatorColor, superView: self)
        
        if image != nil {
            imageView = UIImageView(x: w - 25, y: h - 27, w: 20, h: 20, superView: self)
            imageView.contentMode = .scaleAspectFit
            imageView.image = image!
        } else {
            imageView = UIImageView(x: 0, y: 0, w: 0, h: 0, superView: nil)
        }
        
        textfield = UITextField(
            x: 0, y: h - 25, w: w - 25, h: 20, superView: self)
        textfield.placeholder = placeHolder
        textfield.setValue(placeHolderColor, forKeyPath: "_placeholderLabel.textColor")
        textfield.textColor = color
        
        textfield.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        popLabel = UILabel(x: textfield.x, y: 0, w: textfield.w, h: 15, superView: self)
        popLabel.setTextProperties(text: placeHolder.uppercased(),
                                   size: 10, color: popLabelColor, align: .left)
        
        popLabel.isHidden = true
        
        if sView != nil { sView?.addSubview(self) }
    }
    
    func textFieldDidChange(textField: UITextField) {
        
        if isEmpty == false && textField.text == "" {
            isEmpty = true ; popLabel.isHidden = true
        } else if isEmpty == true && textField.text != "" {
            isEmpty = false ; popLabel.isHidden = false
        }
    }
}
