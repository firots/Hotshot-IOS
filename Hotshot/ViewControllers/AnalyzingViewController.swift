//
//  AnalyzingViewController.swift
//  Hotshot
//
//  Created by Firot on 20.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

class AnalyzingViewController: UIViewController {
    var images = [AnalyzingImage]()
    static let photoHeight: CGFloat = 330
    static let photoWidth: CGFloat = 240
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getRandomImage()
        super.viewWillAppear(animated)
    }
    
    func addImageView() -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: view.frame.width + 400, y: view.center.y - AnalyzingViewController.photoHeight / 2, width: AnalyzingViewController.photoWidth, height: AnalyzingViewController.photoHeight))
        imageView.image = images.randomElement()!.image
        imageView.rotate(angle: 50)
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        return imageView
    }
    
    
    func getRandomImage() {
        let imageView = addImageView()
        
        let enterDuration = 0.5
        let fallDuration = 0.4
        let shakeDurations: [Double] = [Double.random(in: 0.3...0.5), Double.random(in: 0.3...0.5), Double.random(in: 0.3...0.5), Double.random(in: 0.3...0.5), Double.random(in: 0.3...0.5)]
        let shakeDuration = shakeDurations.reduce(0, +)
        let totalDuration = enterDuration + shakeDuration + fallDuration
        
        let relativeEnterDuration = enterDuration / totalDuration
        let relativeShakeDuration =  shakeDuration / totalDuration
        let relativeFallDuration = fallDuration / totalDuration
        
        var relativeShakeStartTime = relativeEnterDuration

        UIView.animateKeyframes(withDuration: totalDuration, delay: 0.0, options: [], animations: { //check for weaks
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: relativeEnterDuration) {
                imageView.center = self.view.center
                imageView.rotate(angle: -50)
            }
            let minR: CGFloat = -15
            let maxR: CGFloat = 15
            var rotateBy: CGFloat = CGFloat.random(in: minR...maxR)

            for i in 0...4 {
                UIView.addKeyframe(withRelativeStartTime: relativeShakeStartTime, relativeDuration: shakeDurations[i] / totalDuration ) {
                    imageView.rotate(angle: rotateBy)
                    imageView.center =  CGPoint(x: self.view.center.x + CGFloat.random(in: -10...10), y: self.view.center.y + CGFloat.random(in: -10...10))
                }
                let rotateMin = minR - rotateBy
                let rotateMax = maxR - rotateBy
                rotateBy = CGFloat.random(in: rotateMin...rotateMax)
                relativeShakeStartTime += shakeDurations[i] / totalDuration
            }

            UIView.addKeyframe(withRelativeStartTime: relativeEnterDuration + relativeShakeDuration, relativeDuration: relativeFallDuration) {
                imageView.frame.origin.y += self.view.frame.height
            }

        }) { (completed) in
            imageView.removeFromSuperview()
            self.getRandomImage()
        }
    }
}
