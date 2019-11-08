//
//  UIIMage-BundleName.swift
//  Hotshot
//
//  Created by Firot on 8.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(bundleName: String) {
        guard let bundlePath = Bundle.main.path(forResource: bundleName, ofType: nil) else { return nil }
        self.init(contentsOfFile: bundlePath)!
    }
}
