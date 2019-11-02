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
    
    let fullMoveDuration = 3.2
    var direction = BlurredImageSlideViewDirection.left
    
    static var images = [UIImage]()
    
    override func awakeFromNib() {
        setVisuals()
    }
    
    static func cacheImages() {
        for i in 1...24 {
            let image = UIImage(named: "hotshotphoto (\(String(i))).jpg")
            if let dImage = image?.desaturate(), let bImage = dImage.blur()  {
                BlurredImageSlideView.images.append(bImage)
            }
        }
    }
}

/* Animations */
extension BlurredImageSlideView {
    func startAnimation(direction: BlurredImageSlideViewDirection) {
        animate(moveDuration: fullMoveDuration / 2, direction: direction)
    }
    
    func animate(moveDuration: Double, direction: BlurredImageSlideViewDirection) {
        let flipDuration = 0.1
        let totalDuration = moveDuration + flipDuration
        
        let relativeMoveDuration = moveDuration / totalDuration
        let relativeFlipDuration = flipDuration / totalDuration
        
        UIView.animateKeyframes(withDuration: totalDuration, delay: 0.0, options: [], animations: { //check for weaks
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: relativeMoveDuration) {
                var movement: CGFloat = 100
                if moveDuration == self.fullMoveDuration {
                    movement = 200
                }
                if direction == .left {
                    movement = movement * -1
                }
                self.imageView.center = CGPoint(x: self.imageView.center.x + movement, y: self.imageView.center.y)
            }
            UIView.addKeyframe(withRelativeStartTime: relativeMoveDuration, relativeDuration: relativeFlipDuration) {
                self.changeImage()
            }
        }) { (completed) in
            self.animate(moveDuration: self.fullMoveDuration, direction: direction.reverse())
        }
        
        
    }
}

/* Manage Images */
extension BlurredImageSlideView {
    func changeImage() {
        if BlurredImageSlideView.images.count == 0 { return }
        BlurredImageSlideView.images.shuffle()
        imageView.image = BlurredImageSlideView.images[0]
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
    
    func reverse() -> BlurredImageSlideViewDirection {
        if self == .left {
            return .right
        }
        return .left
    }
}
