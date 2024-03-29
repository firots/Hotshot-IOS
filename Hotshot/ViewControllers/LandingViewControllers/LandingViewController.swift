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
    @IBOutlet weak var topSplit: LandingSplitView!
    @IBOutlet weak var bottomSplit: LandingSplitView!
    
    override func viewDidLoad() {
        roundedPhotosView.backgroundColor = .clear
        super.viewDidLoad()
        setNavigation()
        setDelegates()
        setSplits()
    }

    func setDelegates() {
        roundedPhotosView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let analyzingVC = segue.destination as? AnalyzingViewController {
            analyzingVC.images = roundedPhotosView.images()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


/* Set Splits */
extension LandingViewController {
    func setSplits() {
        topSplit.direction = .top
        topSplit.lock()
        topSplit.delegate = self
        topSplit.blurredImageSlideView.startAnimation(direction: .left)
        topSplit.blurredImageSlideView.setInitial(image: BlurredImageSlideView.images.first)
        
        bottomSplit.direction = .bottom
        bottomSplit.lock()
        bottomSplit.delegate = self
        bottomSplit.blurredImageSlideView.startAnimation(direction: .right)
        bottomSplit.blurredImageSlideView.setInitial(image: BlurredImageSlideView.images.last)
    }
}
    

extension LandingViewController: LandingSplitViewDelegate {
    func splitViewTapped(at direction: SplitViewDirections) {
        if direction == .top {
            let api = HotshotAPI(delegate: self)
            api.findSimilar(image: roundedPhotosView.images()[0])
        } else {
            performSegue(withIdentifier: "AnalyzeSegue", sender: self)
        }
    }
}

extension LandingViewController: HotshotAPIDelegate {
    func findSimilar(_ result: FindSimilarResult) {
        var description = ""
        if !result.error {
            for celeb in result.celebs {
                description += "\n\(celeb.name)"
                description += "\n\(celeb.percentage)"
                description += "\n\(celeb.rank)"
                description += "\n"
            }
        } else {
            description = "Error"
        }

        
        let ac = UIAlertController(title: "Enter answer", message: description, preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "OK", style: .default)
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
}

extension LandingViewController: RoundedPhotosViewDelegate {
    func addTapped() {
        if isMaxPhotosReached() == true { return }
        loadPhotoPicker()
    }
    
    func isMaxPhotosReached() -> Bool {
        return false
    }
    
    func loadPhotoPicker() {
        let viewController = TLPhotosPickerViewController()
        viewController.modalPresentationStyle = .overFullScreen
        viewController.delegate = self
        var configure = TLPhotosPickerConfigure()
        configure.photoPicker(maxItems: maxSelections)
        viewController.configure = configure
        present(viewController, animated: true, completion: nil)
    }
}

extension LandingViewController: TLPhotosPickerViewControllerDelegate {
    func addPhoto(tag: String, image: UIImage) {
        DispatchQueue.main.async {
            self.roundedPhotosView.add(image: image)
            if self.roundedPhotosView.images().count == 1 {
                self.topSplit.unlock()
            } else if self.roundedPhotosView.images().count > 1 {
                self.bottomSplit.unlock()
                self.topSplit.lock()
            }
        }
    }
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            for item in withTLPHAssets {
                if let image = item.fullResolutionImage {
                    let resizedImage = image.resize(max: 500)
                    self?.addPhoto(tag: item.originalFileName ?? "NaN", image: resizedImage)
                }
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
