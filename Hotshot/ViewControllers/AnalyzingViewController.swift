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
    var currentPhotoId = 0
    var timer: Timer?
    
    @IBOutlet weak var workingLabel: UILabel!
    override func viewDidLoad() {
        workingLabel.text = "Working"
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPhoto()
        workingLabel.alphaGlow(duration: 1.2, alpha: 0.3)
        super.viewWillAppear(animated)
    }
    
    func addPhotoView() -> PhotoView {
        let photoView = PhotoView(frame: CGRect(x: view.frame.width + 400, y: view.center.y - PhotoView.height / 2, width: PhotoView.width, height: PhotoView.height))
        photoView.analyzingPhoto(image: images[currentPhotoId].image)
        if currentPhotoId + 1 >= images.count { currentPhotoId = 0} else { currentPhotoId += 1}
        self.view.addSubview(photoView)
        return photoView
    }
    
    @objc func getPhoto() {
        let photoView = addPhotoView()
        
        let enterDuration = 0.5
        let fallDuration = 0.4
        let shakeDurations: [Double] = [Double.random(in: 0.3...0.5), Double.random(in: 0.3...0.5), Double.random(in: 0.3...0.5), Double.random(in: 0.3...0.5), Double.random(in: 0.3...0.5)]
        let shakeDuration = shakeDurations.reduce(0, +)
        let totalDuration = enterDuration + shakeDuration
        timer = Timer.scheduledTimer(timeInterval: totalDuration + fallDuration - 0.9, target: self, selector: #selector(getPhoto), userInfo: nil, repeats: false)
        
        let relativeEnterDuration = enterDuration / totalDuration
        var relativeShakeStartTime = relativeEnterDuration

        UIView.animateKeyframes(withDuration: totalDuration, delay: 0.0, options: [], animations: { //check for weaks
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: relativeEnterDuration) {
                photoView.center = self.view.center
                photoView.rotate(angle: -50)
            }
            let minR: CGFloat = -9
            let maxR: CGFloat = 9
            var rotateBy: CGFloat = CGFloat.random(in: minR...maxR)

            for i in 0...4 {
                UIView.addKeyframe(withRelativeStartTime: relativeShakeStartTime, relativeDuration: shakeDurations[i] / totalDuration ) {
                    photoView.rotate(angle: rotateBy)
                    photoView.center =  CGPoint(x: self.view.center.x + CGFloat.random(in: -10...10), y: self.view.center.y + CGFloat.random(in: -10...10))
                }
                let rotateMin = minR - rotateBy
                let rotateMax = maxR - rotateBy
                rotateBy = CGFloat.random(in: rotateMin...rotateMax)
                relativeShakeStartTime += shakeDurations[i] / totalDuration
            }

        }) { (completed) in
            self.fallPhoto(photo: photoView, duration: fallDuration)
        }
    }
    
    func fallPhoto(photo: UIView, duration: Double) {
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseIn, animations: {
            photo.rotate(angle: 80)
            photo.center = CGPoint(x: photo.center.x, y: photo.center.y + self.view.frame.height)
        }) { _ in
            photo.removeFromSuperview()
        }
    }
}
