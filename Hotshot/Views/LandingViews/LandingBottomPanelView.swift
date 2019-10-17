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
    @IBOutlet var view: UIView!
    
    override func awakeFromNib() {
        self.view.frame.size = self.frame.size
    }
}

protocol LandingBottomPanelViewDelegate: class {
    func startTapped()
}
