//
//  LandingBottomPanelView.swift
//  Hotshot
//
//  Created by Firot on 16.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

final class LandingBottomPanelView: CustomViewBase {
    weak var delegate: LandingBottomPanelViewDelegate?
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet var view: UIView!
    
    override func awakeFromNib() {
        self.view.frame.size = self.frame.size
    }
    @IBAction func startTapped(_ sender: Any) {
        delegate?.startTapped()
    }
}

protocol LandingBottomPanelViewDelegate: class {
    func startTapped()
}
