//
//  LandingViewController.swift
//  Hotshot
//
//  Created by Firot on 16.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

final class LandingViewController: UIViewController {

    @IBOutlet weak var landingTopPanelView: LandingTopPanelView!
    @IBOutlet weak var landingBottomPanelView: LandingBottomPanelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setDelegates()
    }
    
    func setDelegates() {
        landingTopPanelView.delegate = self
        landingBottomPanelView.delegate = self
    }
}

extension LandingViewController: LandingBottomPanelViewDelegate {
    func startTapped() {
         
    }
}

extension LandingViewController: LandingTopPanelViewDelegate {
    func addTapped() {
        
    }
}
