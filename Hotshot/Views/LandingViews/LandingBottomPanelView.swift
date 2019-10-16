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
}

protocol LandingBottomPanelViewDelegate: class {
    func startTapped()
}
