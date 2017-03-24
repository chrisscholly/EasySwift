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
    var numberLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        drawTopView()
        drawContentView()
        drawBottomView()
    }
    
    func drawTopView()
    {
        // topView
        
        let topView = UIView(x: 0, y: 0, w: view.w, h: 64, superView: view)
        topView.backgroundColor = UIColor(r: 28, g: 55, b: 81)
        
        _ = UILabel(text: "Easy Swift", x: 0, y: 20, width: view.w, height: 44, textColor: UIColor(r: 131, g: 140, b: 150), fontSize: 20, align: .center, superView: topView)
    }
    
    func drawContentView()
    {
        // contentView
        
        let contentView = UIView(x: 0, y: 64, w: view.w, h: view.h - 64, superView: view)
        contentView.backgroundColor = UIColor(r: 131, g: 140, b: 150)
        
        numberLabel = UILabel(x: 0, y: 0, w: 50, h: 50, superView: view)
        numberLabel.setTextProperties(text: "0", size: 36, color: UIColor(r: 28, g: 55, b: 81), align: .center)
        numberLabel.centeredInSuperView()
        
        // left squares
        
        var leftSquares = [UIView]()
        let squareSize: CGFloat = contentView.h / 39
        for _ in 0...19
        {
            let squareView = UIView(x: 0, y: 0, w: squareSize, h: squareSize, superView: contentView)
            squareView.backgroundColor = (UIColor(r: 28, g: 55, b: 81))
            leftSquares.append(squareView)
        }
        alignOnY(views: leftSquares, spacing: squareSize, x: 0, superView: contentView)
        
        // right squares
        
        var rightSquares = [UIView]()
        for _ in 0...19
        {
            let squareView = UIView(x: 0, y: 0, w: squareSize, h: squareSize, superView: contentView)
            
            squareView.backgroundColor = (UIColor(r: 28, g: 55, b: 81))
            
            rightSquares.append(squareView)
        }
        alignOnY(views: rightSquares, spacing: squareSize, x: view.w - squareSize, superView: contentView)
    }
    
    func drawBottomView()
    {
        // bottomView
        
        var circlesButton = [UIButton]()
        for i in 0...4
        {
            let circle = UIButton(x: 0, y: 0, w: 30, h: 30, bgColor: UIColor(r: 28, g: 55, b: 81), superView: view)
            
            circle.rounded()
            
            circle.setProperties(text: i.toString, size: 18, color: UIColor(r: 131, g: 140, b: 150))
            circle.setAction(action: #selector(buttonClicked(sender:)), tag: i)
            
            circlesButton.append(circle)
        }
        alignOnX(views: circlesButton, spacing: 15, y: view.h - 50, superView: view)
    }

    func buttonClicked(sender: UIButton) {
        print("buttonClicked (tag : \(sender.tag))")
        numberLabel.text = sender.tag.toString
    }
}
