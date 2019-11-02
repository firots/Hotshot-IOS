//
//  LandingSplitView.swift
//  Hotshot
//
//  Created by Firot on 2.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

class LandingSplitView: CustomViewBase {
    @IBOutlet weak var blurredImageSlideView: BlurredImageSlideView!
    @IBOutlet var view: UIView!
    @IBOutlet weak var bottomCons: NSLayoutConstraint!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var titleContainer: UIView!
    
    var locked = true
    weak var delegate: LandingSplitViewDelegate?
    
    var color = SplitViewColors.gray {
        didSet {
            blurredImageSlideView.overlayView.backgroundColor = color
        }
    }
    
    var direction = SplitViewDirections.top
    
    func lock() {
        color = .gray
        if direction == .top {
            title.text = "SINGLE MEDIA"
        } else {
            title.text = "ADD MORE PHOTOS"
        }
        subtitle.text = "Feature Locked"
        locked = true
    }
    
    func unlock() {
        if direction == .top {
            color = SplitViewColors.red
            title.text = "SHOW ME"
            subtitle.text = "Who do I look like?"
        } else {
            color = SplitViewColors.blue
            title.text = "PICK MY"
            subtitle.text = "Hotshot Photo"
        }
        locked = false
    }
    
    override func awakeFromNib() {
        titleContainer.backgroundColor = .clear
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
    }
    
    @objc func tapped() {
        if locked { return }
        delegate?.splitViewTapped(at: direction)
    }

}

protocol LandingSplitViewDelegate: class {
    func splitViewTapped(at direction: SplitViewDirections)
}

enum SplitViewColors {
    static let gray = UIColor(netHex: 0x222222)
    static let red = UIColor(netHex: 0xE92323)
    static let blue = UIColor(netHex: 0x376c8a)
}

enum SplitViewDirections {
    case top
    case bottom
}
