//
//  Defaults.swift
//  EasySwift
//
//  Created by Sabbe on 24/03/17.
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

class Defaults
{
    static let defaults = UserDefaults.standard
    
    // setters
    
    static func set(key:String, value:Any) { defaults.set(value, forKey: key) }
    
    // string 
    
    static func getString(key: String) -> String
    {
        let data = Defaults.defaults.string(forKey: key)
        return data != nil ? data! : ""
    }
    
    static func getStringArray(key: String) -> [String]
    {
        let data = Defaults.defaults.array(forKey: key)
        return data is [String] ? (data! as! [String]) : [String]()
    }
    
    // double
    
    static func getDouble(key: String) -> Double {
        return Defaults.defaults.double(forKey: key)
    }
    
    static func getDoubleArray(key: String) -> [Double] {
        let data = Defaults.defaults.array(forKey: key)
        return data is [Double] ? (data! as! [Double]) : ([Double]())
    }
    
    // int
    
    static func getInt(key: String) -> Int {
        return  Defaults.defaults.integer (forKey: key)
    }
    
    static func getIntArray(key:String)->[Int] {
        let data = Defaults.defaults.array(forKey: key)
        return data is [Int] ? (data! as! [Int]) : ([Int]())
    }
    
    
    // bool
    
    static func getBool(key: String) -> Bool {
        return Defaults.defaults.bool(forKey: key) as Bool
    }
    
    static func getBoolArray(key: String) -> [Bool] {
        let data = Defaults.defaults.array(forKey: key)
        return data is [Bool] ? (data! as! [Bool]) : ([Bool]())
    }

    // object
    
    static func getObject(key: String) -> Any? {
        return Defaults.defaults.object(forKey: key)
    }
}

