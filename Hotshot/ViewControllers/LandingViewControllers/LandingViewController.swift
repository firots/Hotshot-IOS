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
    @IBOutlet weak var selectedPhotosContainer: UIView!
    
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
        if let selectedPhotosVC = self.children.first as? SelectedPhotosCollectionViewController, let model = selectedPhotosVC.collectionViewDataSource.model as? SelectedPhotosViewModel {
            let selectedPhotoCell = SelectedPhotoCellModel(tag: "")
            selectedPhotoCell.image = UIImage(named: "firad.jpg")
            if model.sections.isEmpty {
                let section = CollectionViewSectionModel()
                model.sections.append(section)
            }
            model.sections[0].items.append(selectedPhotoCell)
            selectedPhotosVC.dataChanged()
        }
    }
}
