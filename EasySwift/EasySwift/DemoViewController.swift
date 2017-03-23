//
//  DemoViewController.swift
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

class DemoViewController: UIViewController
{
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        drawView()
    }
    
    func drawView()
    {
        let boxView = UIView(x: 0, y: 0, w: 200, h: 200, superView: view)
        boxView.backgroundColor = .black
        boxView.centeredInSuperView()
        boxView.rounded()
        
        let mainCircleView = UIView(x: 0, y: 0, w: 150, h: 150, superView: boxView)
        mainCircleView.backgroundColor = .white
        mainCircleView.centeredInSuperView()
        mainCircleView.rounded()
        
        var circleViewList1 = [UIView]()
        
        for _ in 0...3
        {
            let circleView = UIView(x: 0, y: 0, w: 20, h: 20, bgColor: .black, superView: boxView)
            circleView.rounded() ; circleView.borded(color: .black)
            circleViewList1.append(circleView)
        }
        alignOnX(views: circleViewList1, spacing: 15, y: boxView.h / 2 - 10, superView: boxView)
        
        var circleViewList2 = [UIView]()
        
        for _ in 0...3
        {
            let circleView = UIView(x: 0, y: 0, w: 20, h: 20, bgColor: .black, superView: boxView)
            circleView.rounded() ; circleView.borded(color: .black)
            circleViewList2.append(circleView)
        }
        alignOnY(views: circleViewList2, spacing: 15, x: boxView.w / 2 - 10, superView: boxView)
        
        UIView.animate(withDuration: 2, animations: {
            alignOnY(views: circleViewList1, spacing: 15, x: boxView.w / 2 - 10, superView: boxView)
            alignOnX(views: circleViewList2, spacing: 15, y: boxView.h / 2 - 10, superView: boxView)
        })
        
        let b = UIButton(x: 0, y: 0, w: 0, h: 64, superView: view)
        b.backgroundColor = .black
        
        let button = UIButton(x: view.w / 2 - 140, y: view.h - 70, w: 280, h: 50, titleColor: .white, bgColor: .black, title: "Easy Swift", alignment: .center, selector: #selector(buttonClicked), superView: view)
        
        button.rounded()
        
        UIView.animate(withDuration: 1, delay: 3, animations: {
            b.frame = CGRect(x: 0, y: 0, width: self.view.w , height: 65)
            UIView.animate(withDuration: 3, delay: 3, animations: {
                
                for circle in circleViewList1 + circleViewList2 {
                    circle.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                    circle.centeredInSuperView()
                    circle.backgroundColor = .orange
                }
                UIView.animate(withDuration: 3, delay: 6, animations: {
                    
                    for circle in circleViewList1 + circleViewList2
                    {
                        circle.frame.size = CGSize(width: 20, height: 20)
                        alignOnY(views: circleViewList1, spacing: 15, x: boxView.w / 2 - 10, superView: boxView)
                        alignOnX(views: circleViewList2, spacing: 15, y: boxView.h / 2 - 10, superView: boxView)
                    }
                    button.backgroundColor = .orange
                    button.borded(color: .black)
                })
            })
        })
        
        print("hello".toInt())
        print("123".toInt())
        print("123131.1313".toFloat())
        print("1313131.11.11.11.".toDouble())
    }
    
    func buttonClicked()
    {
        print(#function)
    }
}
