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
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .blackOpaque
        
        addLogo()
        
        addHamburgerButton()
    }
    
    func addLogo() {
        let logo = UIImage(named: "logo.png")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 172, height: 58))
        imageView.image = logo
        imageView.contentMode = .scaleAspectFit
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: imageView)
    }
    
    func addHamburgerButton() {
        let hamburgerIcon = UIImage(named: "hamburger.png")
        navigationItem.leftBarButtonItem  = UIBarButtonItem(image: hamburgerIcon, style: .plain, target: self, action: #selector(hamburgerTapped))
    }
    
    @objc func hamburgerTapped() {
        
    }
}
