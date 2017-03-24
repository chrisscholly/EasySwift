//
//  UIImage.swift
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
//  OUT OF OR IN


import UIKit
import QuartzCore
import CoreGraphics
import Accelerate

// MARK: - Extensions

extension UIImage
{
    static var shared: NSCache<AnyObject, AnyObject>! {
        struct StaticSharedCache {
            static var shared: NSCache<AnyObject, AnyObject>? = NSCache()
        }
        
        return StaticSharedCache.shared!
    }
    
    public func toBase64() -> String
    {
        let imageData = UIImagePNGRepresentation(self)
        
        return (imageData?.base64EncodedString())!
    }
    
    public func resizeWith(percentage: CGFloat) -> UIImage?
    {
        let imageView = UIImageView(
            frame: CGRect(origin: .zero, size: CGSize(
                width: size.width * percentage, height: size.height * percentage)))
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage
    {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    class func image(fromURL url: String, placeholder: UIImage, shouldCacheImage: Bool = true, closure: @escaping (_ image: UIImage?) -> ()) -> UIImage? {
        if shouldCacheImage {
            if let image = UIImage.shared.object(forKey: url as AnyObject) as? UIImage {
                closure(nil)
                return image
            }
        }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        if let nsURL = URL(string: url) {
            session.dataTask(with: nsURL, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    DispatchQueue.main.async {
                        closure(nil)
                    }
                }
                if let data = data, let image = UIImage(data: data) {
                    if shouldCacheImage {
                        UIImage.shared.setObject(image, forKey: url as AnyObject)
                    }
                    DispatchQueue.main.async {
                        closure(image)
                    }
                }
                session.finishTasksAndInvalidate()
            }).resume()
        }
        return placeholder
    }
}

// MARK: - Images effects

extension UIImage
{
    func applyLightEffect() -> UIImage? {
        return applyBlur(withRadius: 30, tintColor: UIColor(white: 1.0, alpha: 0.3), saturationDeltaFactor: 1.8)
    }
    
    /**
     Applies a extra light blur effect to the image
     
     - Returns New image or nil
     */
    func applyExtraLightEffect() -> UIImage? {
        return applyBlur(withRadius: 20, tintColor: UIColor(white: 0.97, alpha: 0.82), saturationDeltaFactor: 1.8)
    }
    
    /**
     Applies a dark blur effect to the image
     
     - Returns New image or nil
     */
    func applyDarkEffect() -> UIImage? {
        return applyBlur(withRadius: 20, tintColor: UIColor(white: 0.11, alpha: 0.73), saturationDeltaFactor: 1.8)
    }
    
    /**
     Applies a color tint to an image
     
     - Parameter color: The tint color
     
     - Returns New image or nil
     */
    func applyTintEffect(tintColor: UIColor) -> UIImage? {
        let effectColorAlpha: CGFloat = 0.6
        var effectColor = tintColor
        let componentCount = tintColor.cgColor.numberOfComponents
        if componentCount == 2 {
            var b: CGFloat = 0
            if tintColor.getWhite(&b, alpha: nil) {
                effectColor = UIColor(white: b, alpha: effectColorAlpha)
            }
        } else {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            
            if tintColor.getRed(&red, green: &green, blue: &blue, alpha: nil) {
                effectColor = UIColor(red: red, green: green, blue: blue, alpha: effectColorAlpha)
            }
        }
        return applyBlur(withRadius: 10, tintColor: effectColor, saturationDeltaFactor: -1.0)
    }
    
    /**
     Applies a blur to an image based on the specified radius, tint color saturation and mask image
     
     - Parameter blurRadius: The radius of the blur.
     - Parameter tintColor: The optional tint color.
     - Parameter saturationDeltaFactor: The detla for saturation.
     - Parameter maskImage: The optional image for masking.
     
     - Returns New image or nil
     */
    func applyBlur(withRadius blurRadius: CGFloat, tintColor: UIColor?, saturationDeltaFactor: CGFloat, maskImage: UIImage? = nil) -> UIImage? {
        guard size.width > 0 && size.height > 0 && cgImage != nil else {
            return nil
        }
        if maskImage != nil {
            guard maskImage?.cgImage != nil else {
                return nil
            }
        }
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        var effectImage = self
        let hasBlur = blurRadius > CGFloat(FLT_EPSILON)
        let hasSaturationChange = fabs(saturationDeltaFactor - 1.0) > CGFloat(FLT_EPSILON)
        if (hasBlur || hasSaturationChange) {
            
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            let effectInContext = UIGraphicsGetCurrentContext()
            effectInContext?.scaleBy(x: 1.0, y: -1.0)
            effectInContext?.translateBy(x: 0, y: -size.height)
            effectInContext?.draw(cgImage!, in: imageRect)
            
            var effectInBuffer = vImage_Buffer(
                data: effectInContext?.data,
                height: UInt((effectInContext?.height)!),
                width: UInt((effectInContext?.width)!),
                rowBytes: (effectInContext?.bytesPerRow)!)
            
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
            let effectOutContext = UIGraphicsGetCurrentContext()
            
            var effectOutBuffer = vImage_Buffer(
                data: effectOutContext?.data,
                height: UInt((effectOutContext?.height)!),
                width: UInt((effectOutContext?.width)!),
                rowBytes: (effectOutContext?.bytesPerRow)!)
            
            if hasBlur {
                let inputRadius = blurRadius * UIScreen.main.scale
                let sqrtPi: CGFloat = CGFloat(sqrt(M_PI * 2.0))
                var radius = UInt32(floor(inputRadius * 3.0 * sqrtPi / 4.0 + 0.5))
                if radius % 2 != 1 {
                    radius += 1 // force radius to be odd so that the three box-blur methodology works.
                }
                let imageEdgeExtendFlags = vImage_Flags(kvImageEdgeExtend)
                vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
            }
            
            var effectImageBuffersAreSwapped = false
            
            if hasSaturationChange {
                let s: CGFloat = saturationDeltaFactor
                let floatingPointSaturationMatrix: [CGFloat] = [
                    0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                    0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                    0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                    0,                    0,                    0,  1
                ]
                
                let divisor: CGFloat = 256
                let matrixSize = floatingPointSaturationMatrix.count
                var saturationMatrix = [Int16](repeating: 0, count: matrixSize)
                
                for i: Int in 0 ..< matrixSize {
                    saturationMatrix[i] = Int16(round(floatingPointSaturationMatrix[i] * divisor))
                }
                
                if hasBlur {
                    vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
                    effectImageBuffersAreSwapped = true
                } else {
                    vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
                }
            }
            
            if !effectImageBuffersAreSwapped {
                effectImage = UIGraphicsGetImageFromCurrentImageContext()!
            }
            
            UIGraphicsEndImageContext()
            
            if effectImageBuffersAreSwapped {
                effectImage = UIGraphicsGetImageFromCurrentImageContext()!
            }
            
            UIGraphicsEndImageContext()
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let outputContext = UIGraphicsGetCurrentContext()
        outputContext?.scaleBy(x: 1.0, y: -1.0)
        outputContext?.translateBy(x: 0, y: -size.height)
        
        outputContext?.draw(self.cgImage!, in: imageRect)
        
        if hasBlur {
            outputContext?.saveGState()
            if let image = maskImage {
                outputContext?.clip(to: imageRect, mask: image.cgImage!);
            }
            outputContext?.draw(effectImage.cgImage!, in: imageRect)
            outputContext?.restoreGState()
        }
        
        if let color = tintColor {
            outputContext?.saveGState()
            outputContext?.setFillColor(color.cgColor)
            outputContext?.fill(imageRect)
            outputContext?.restoreGState()
        }
        
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return outputImage
        
    }
}
