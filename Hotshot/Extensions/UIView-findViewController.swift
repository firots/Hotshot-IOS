//
//  UIView-findViewController.swift
//  Hotshot
//
//  Created by Firot on 21.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
