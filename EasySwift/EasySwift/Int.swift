//
//  Int.swift
//  EasySwift
//
//  Created by Sabbe on 23/03/17.
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

extension Int
{
    // MARK: - Check
    
    public var isPositive: Bool     { return (self > 0) }
    public var isNegative: Bool     { return (self < 0) }
    
    public var isEven: Bool         { return (self % 2 == 0) }
    public var isOdd: Bool          { return (self % 2 != 0) }
    
    // MARK: - Converters
    
    public var toString: String     { return String(self) }
    public var toDouble: Double     { return Double(self) }
    public var toFloat: Float       { return Float(self) }
    public var toCGFloat: CGFloat   { return CGFloat(self) }

    public var toUInt: UInt         { return UInt(self) }
    public var toInt32: Int32       { return Int32(self) }
}