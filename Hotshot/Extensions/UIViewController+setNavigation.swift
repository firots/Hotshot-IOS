//
//  UIViewController+setNavigation.swift
//  Hotshot
//
//  Created by Firot on 16.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

extension UIViewController {
    func setNavigation() {
        navigationController?.navigationBar.barTintColor = view.backgroundColor
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}
