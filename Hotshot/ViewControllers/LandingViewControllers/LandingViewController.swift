//
//  LandingViewController.swift
//  Hotshot
//
//  Created by Firot on 16.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit
import TLPhotoPicker
import PhotosUI

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
        let viewController = TLPhotosPickerViewController()
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }
    
    func addPhoto(tag: String, image: UIImage) {
        if let selectedPhotosVC = self.children.first as? SelectedPhotosCollectionViewController, let model = selectedPhotosVC.collectionViewDataSource.model as? SelectedPhotosViewModel {
            let selectedPhotoCell = SelectedPhotoCellModel(tag: tag)
            selectedPhotoCell.image = image
            if model.sections.isEmpty {
                let section = CollectionViewSectionModel()
                model.sections.append(section)
            }
            model.sections[0].items.append(selectedPhotoCell)
            selectedPhotosVC.collectionView.insertItems(at: [IndexPath(row: model.sections[0].items.count - 1, section: 0)])
            selectedPhotosVC.collectionView.reloadEmptyDataSet()
        }
    }
}

extension LandingViewController: TLPhotosPickerViewControllerDelegate {
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        for item in withTLPHAssets {
            if let image = item.fullResolutionImage {
                addPhoto(tag: item.originalFileName ?? "NaN", image: image)
            }
        }
    }
    func dismissPhotoPicker(withPHAssets: [PHAsset]) {
        // if you want to used phasset.
    }
    func photoPickerDidCancel() {
        // cancel
    }
    func dismissComplete() {
        // picker viewcontroller dismiss completion
    }
    func canSelectAsset(phAsset: PHAsset) -> Bool {
        //Custom Rules & Display
        //You can decide in which case the selection of the cell could be forbidden.
        true
    }
    func didExceedMaximumNumberOfSelection(picker: TLPhotosPickerViewController) {
        // exceed max selection
    }
    func handleNoAlbumPermissions(picker: TLPhotosPickerViewController) {
        // handle denied albums permissions case
    }
    func handleNoCameraPermissions(picker: TLPhotosPickerViewController) {
        // handle denied camera permissions case
    }
}
