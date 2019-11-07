//
//  UIImage-Resize.swift
//  Hotshot
//
//  Created by Firot on 7.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func resize(max: CGFloat) -> UIImage {
        let maxWH = CGFloat.maximum(self.size.width, self.size.height); if max > maxWH { return self }
        let ratio = max / maxWH
        return scale(by: ratio)
    }
    
    func scale(by ratio: CGFloat) -> UIImage {
        let newSize = CGSize(width: self.size.width * ratio, height: self.size.height * ratio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? self
    }
    

}

