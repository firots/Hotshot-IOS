//
//  UIView+AlphaGlow.swift
//  Hotshot
//
//  Created by Firot on 21.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation


extension UIView {
    func alphaGlow(duration: Double, alpha: CGFloat) {
        UIView.animate(withDuration: 1.2,
            delay:0.0,
            options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
            animations: { self.alpha = alpha },
            completion: nil
        )
    }
}
