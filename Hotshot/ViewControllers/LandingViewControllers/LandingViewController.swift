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
    private let maxSelections = 4
    @IBOutlet weak var roundedPhotosView: RoundedPhotosView!
    
    override func viewDidLoad() {
        roundedPhotosView.backgroundColor = .clear
        super.viewDidLoad()
        setNavigation()
        setDelegates()
    }
    
    func setDelegates() {
        roundedPhotosView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let analyzingVC = segue.destination as? AnalyzingViewController {
            analyzingVC.images = roundedPhotosView.images()
        }
    }
}

/*extension LandingViewController: LandingBottomPanelViewDelegate {
    func startTapped() {
        performSegue(withIdentifier: "AnalyzeSegue", sender: self)
    }
}*/

extension LandingViewController: RoundedPhotosViewDelegate {
    func addTapped() {
        print("a2")
        if isMaxPhotosReached() == true { return }
        loadPhotoPicker()
    }
    
    func isMaxPhotosReached() -> Bool {
        return false
    }
    
    func loadPhotoPicker() {
        let viewController = TLPhotosPickerViewController()
        viewController.delegate = self
        var configure = TLPhotosPickerConfigure()
        configure.photoPicker(maxItems: maxSelections)
        viewController.configure = configure
        present(viewController, animated: true, completion: nil)
    }
}

extension LandingViewController: TLPhotosPickerViewControllerDelegate {
    func addPhoto(tag: String, image: UIImage) {
        roundedPhotosView.add(image: image)
    }
    
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
