//
//  UIView+rotate.swift
//  Hotshot
//
//  Created by Firot on 20.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians)
        self.transform = rotation
    }
}
