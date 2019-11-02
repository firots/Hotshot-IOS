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
        let totalDuration = moveDuration
        let relativeMoveDuration = moveDuration / totalDuration
        
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
        }) { (completed) in
            let toImage = self.getRandomImage()
                UIView.transition(with: self.imageView, duration:1, options: .transitionCrossDissolve, animations: { self.imageView.image = toImage } )
                { (completed) in
                    self.animate(moveDuration: self.fullMoveDuration, direction: direction.reverse())
                }
            }
    }
}

/* Manage Images */
extension BlurredImageSlideView {
    func changeImage() {
        if BlurredImageSlideView.images.count == 0 { return }
        imageView.image = BlurredImageSlideView.images.randomElement()!
    }
    
    func getRandomImage() -> UIImage {
        return BlurredImageSlideView.images.randomElement()!
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
