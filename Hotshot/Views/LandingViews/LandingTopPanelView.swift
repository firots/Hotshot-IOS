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
}

protocol LandingTopPanelViewDelegate: class {
    func addTapped()
}
