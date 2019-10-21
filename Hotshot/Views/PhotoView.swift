//
//  PhotoView.swift
//  Hotshot
//
//  Created by Firot on 21.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

class PhotoView: CustomViewBase {
    static let height: CGFloat = 330
    static let width: CGFloat = 240
    @IBOutlet weak var imageView: UIImageView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    private func addShadow() {
        layer.masksToBounds = false
        layer.shadowRadius = 10
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height:10)
    }
    
    func analyzingPhoto(image: UIImage) {
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        addShadow()
        rotate(angle: 50)
    }
}
