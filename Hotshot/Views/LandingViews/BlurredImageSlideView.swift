//
//  BlurredImageSlideView.swift
//  Hotshot
//
//  Created by Firot on 2.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

final class BlurredImageSlideView: CustomViewBase {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var bottomCons: NSLayoutConstraint!
    
    let moveDuration: Double = 5
    let xOffset: CGFloat = 15
    var direction = BlurredImageSlideViewDirection.left
    
    static var images = [UIImage]()
    static var imageIDs = Array(1...24)
    
    override func awakeFromNib() {
        setVisuals()
        self.view.frame.size = self.frame.size
    }
    
    static func cacheImages() {
        imageIDs.shuffle()
        cacheImage(id: imageIDs[0])
        cacheImage(id: imageIDs[1])
        DispatchQueue.global(qos: .userInteractive).async {
            for (i, id) in imageIDs.enumerated() {
                if i > 1 { cacheImage(id: id) }
            }
        }
    }
    
    private static func cacheImage(id: Int) {
        let image = UIImage(bundleName: createImageName(id: id))?.scale(by: 0.25)
        if let dImage = image?.desaturate(), let bImage = dImage.blur(radius: 7.5)  {
            BlurredImageSlideView.images.append(bImage)
        }
    }
    
    static func createImageName(id: Int) -> String {
        "hotshotphoto (\(String(id))).jpg"
    }
}

/* Animations */
extension BlurredImageSlideView {
    func startAnimation(direction: BlurredImageSlideViewDirection) {
        var movement = xOffset
        if direction == .left { movement = movement * (-1) }
        animate(moveDuration: moveDuration / 2, direction: direction, movement: movement)
    }
    
    func animate(moveDuration: Double, direction: BlurredImageSlideViewDirection, movement: CGFloat) {
        UIView.animate(withDuration: moveDuration, animations: {
            self.imageView.center.x = self.view.center.x + movement
        }) { (completed) in
            let toImage = self.getRandomImage()
            UIView.transition(with: self.imageView, duration:1, options: .transitionCrossDissolve, animations: { self.imageView.image = toImage }, completion: nil )
            self.animate(moveDuration: self.moveDuration, direction: direction.reverse(), movement: movement * -1)
        }
    }
}

/* Manage Images */
extension BlurredImageSlideView {
    func setInitial(image: UIImage?) {
        imageView.image = image
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
