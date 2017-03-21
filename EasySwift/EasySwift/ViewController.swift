//
//  ViewController.swift
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

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        _ = TextfieldView(frame: CGRect(x: 15, y: 40, w: view.w - 30, h: 50), placeHolder: "Email", image: nil, color: .blue, popLabelColor: .orange, placeHolderColor: .red, separatorColor: .gray, sView: view)
        
        let boxView = UIView(x: 0, y: 0, w: 200, h: 200, superView: view)
        boxView.backgroundColor = .black
        boxView.centeredInSuperView()
    
        let mainCircleView = UIView(x: 0, y: 0, w: 150, h: 150, superView: boxView)
        mainCircleView.backgroundColor = .white
        mainCircleView.centeredInSuperView()
        mainCircleView.rounded()
        
        var circleViewList1 = [UIView]()
    
        for _ in 0...3
        {
            let circleView = UIView(x: 0, y: 0, w: 20, h: 20, bgColor: .red, superView: boxView)
            circleView.rounded() ; circleView.borded(color: .red)
            circleViewList1.append(circleView)
        }
        alignOnX(views: circleViewList1, spacing: 15, y: boxView.h / 2 - 10, superView: boxView)
        
        var circleViewList2 = [UIView]()

        for _ in 0...3
        {
            let circleView = UIView(x: 0, y: 0, w: 20, h: 20, bgColor: .red, superView: boxView)
            circleView.rounded() ; circleView.borded(color: .red)
            circleViewList2.append(circleView)
        }
        alignOnY(views: circleViewList2, spacing: 15, x: boxView.w / 2 - 10, superView: boxView)
    }
}

