//
//  LandingTopPanelView.swift
//  Hotshot
//
//  Created by Firot on 16.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

final class LandingTopPanelView: CustomViewBase {
    weak var delegate: LandingTopPanelViewDelegate?
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet var view: UIView!
    
    override func awakeFromNib() {
        self.view.frame.size = self.frame.size
        let tintedImage = addButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
        addButton.setImage(tintedImage, for: .normal)
        if #available(iOS 13.0, *) {
            addButton.tintColor = .label
        }
    }
    
    func setAnchors() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
       // addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @IBAction func addTapped(_ sender: Any) {
        delegate?.addTapped()
    }
}

protocol LandingTopPanelViewDelegate: class {
    func addTapped()
}
