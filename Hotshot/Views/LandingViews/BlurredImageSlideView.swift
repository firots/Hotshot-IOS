//
//  BlurredImageSlideView.swift
//  Hotshot
//
//  Created by Firot on 2.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

class BlurredImageSlideView: CustomViewBase {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var bottomCons: NSLayoutConstraint!
    
    var images = [UIImage]()
    var direction = BlurredImageSlideViewDirection.left
    
    override func awakeFromNib() {
        setVisuals()
    }

}

/* Animations */
extension BlurredImageSlideView {
    func startAnimation(direction: BlurredImageSlideViewDirection) {
        
    }
}

/* Manage Images */
extension BlurredImageSlideView {
    private func changeImage() {
        if images.count == 0 { return }
        images.shuffle()
        imageView.image = images[0]
    }
    
    func addImages(images: [UIImage?]) {
        for image in images {
            if let dImage = image?.desaturate(), let bImage = dImage.blur()  {
                self.images.append(bImage)
            }
        }
        changeImage()
    }
}

/* Set Visuals */
extension BlurredImageSlideView {
    private func setOverlay() {
        overlayView.alpha = 0.75
    }
    
    private func setVisuals() {
        setOverlay()
    }
}



enum BlurredImageSlideViewDirection {
    case left
    case right
}
