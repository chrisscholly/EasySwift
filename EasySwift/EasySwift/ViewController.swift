//
//  ViewController.swift
//  EasySwift
//
//  Created by Sabbe on 21/03/17.
//  Copyright © 2017 sabbe.kev. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
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

