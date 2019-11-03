//
//  LandingSplitView.swift
//  Hotshot
//
//  Created by Firot on 2.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

final class LandingSplitView: CustomViewBase {
    @IBOutlet weak var blurredImageSlideView: BlurredImageSlideView!
    @IBOutlet var view: UIView!
    @IBOutlet weak var bottomCons: NSLayoutConstraint!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var titleContainer: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    var locked = true
    weak var delegate: LandingSplitViewDelegate?
    
    var color = SplitViewColors.gray {
        didSet {
            blurredImageSlideView.overlayView.backgroundColor = color
        }
    }
    
    var direction = SplitViewDirections.top {
        didSet {
            setAttLabels()
        }
    }
    
    func lock() {
        color = .gray
        if direction == .top {
            title.text = "SINGLE MEDIA"
        } else {
            title.text = "ADD MORE PHOTOS"
        }
        iconView.image = UIImage(named: "landinglock.png")
        subtitle.text = "Feature Locked"
        bottomLabel.isHidden = true
        topLabel.isHidden = true
        locked = true
    }
    
    func unlock() {
        if direction == .top {
            color = SplitViewColors.red
            title.text = "SHOW ME"
            subtitle.text = "Who do I look like?"
            topLabel.isHidden = false
            iconView.image = UIImage(named: "landingtoplogo.png")
        } else {
            color = SplitViewColors.blue
            title.text = "PICK MY"
            subtitle.text = "Hotshot Photo"
            bottomLabel.isHidden = false
            iconView.image = UIImage(named: "landingbottomlogo.png")
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


/* Attr Strings */
extension LandingSplitView {
    func setAttLabels() {
        let descString: String
        var stringsToAttr = [String: [NSAttributedString.Key: Any]]()
        let boldAttr = [NSAttributedString.Key.font: UIFont(name: "KenyanCoffeeRg-Bold", size: 22.0) as Any]
        let label: UILabel
        if direction == .bottom {
            descString = "let us tell you which photo is the best"
            stringsToAttr["photo"] = boldAttr
            stringsToAttr["best"] = boldAttr
            label = bottomLabel
        } else {
            descString = "let us tell you which celebrity is your look-alike"
            stringsToAttr["celebrity"] = boldAttr
            stringsToAttr["look-alike"] = boldAttr
            label = topLabel
        }
        label.attributedText = descString.setAttr(words: stringsToAttr)
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


