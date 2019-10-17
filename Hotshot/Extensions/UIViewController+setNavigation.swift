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
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
