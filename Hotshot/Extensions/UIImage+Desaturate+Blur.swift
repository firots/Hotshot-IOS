//
//  UIImage+Filter.swift
//  Hotshot
//
//  Created by Firot on 2.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func desaturate() -> UIImage? {
        guard let currentCGImage = self.cgImage else { return nil }
        let currentCIImage = CIImage(cgImage: currentCGImage)

        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(currentCIImage, forKey: "inputImage")
        filter?.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: "inputColor")
        filter?.setValue(1.0, forKey: "inputIntensity")
        
        guard let outputImage = filter?.outputImage else { return nil }
        let context = CIContext()
        guard let cgimg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
        return UIImage(cgImage: cgimg)
    }
    
    func blur() -> UIImage? {
        guard let currentCGImage = self.cgImage else { return nil }
        let currentCIImage = CIImage(cgImage: currentCGImage)
        
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(currentCIImage, forKey: kCIInputImageKey)
        filter?.setValue(12, forKey: kCIInputRadiusKey)
        guard let outputImage = filter?.outputImage else { return nil }
        let context = CIContext()
        guard let cgimg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
        
        return (UIImage(cgImage: cgimg))
    }
}
