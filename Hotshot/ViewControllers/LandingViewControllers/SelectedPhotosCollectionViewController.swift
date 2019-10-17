//
//  SelectedPhotosCollectionViewController.swift
//  Hotshot
//
//  Created by Firot on 16.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

class SelectedPhotosCollectionViewController: UICollectionViewController,
    HasCollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var emptyView: UIView?
    var collectionViewDataSource: CollectionViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        loadDataSource(SelectedPhotosDataSource(model: SelectedPhotosViewModel()))
        setDZN()
    }
    
    func registerCells() {
        let selectedPhotosCell = UINib(nibName: "SelectedPhotosCell", bundle: nil)
        self.collectionView.register(selectedPhotosCell, forCellWithReuseIdentifier: "SelectedPhotosCell")
    }
    
    func setDZN() {
        collectionView.emptyDataSetSource = self
        collectionView.emptyDataSetDelegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75 , height: 75)
    }
}

extension SelectedPhotosCollectionViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "No Photos"
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
        return NSAttributedString(string: str, attributes: attrs)
    }

    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "Select some photos"
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body)]
        return NSAttributedString(string: str, attributes: attrs)
    }

    /*func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "taylor-swift")
    }

    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        let str = "Add Grokkleglob"
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .callout)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func buttonImage(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> UIImage? {
        return UIImage(named: "addphoto.gif")
    }

    func emptyDataSet(_ scrollView: UIScrollView, didTap button: UIButton) {
        let ac = UIAlertController(title: "Button tapped!", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Hurray", style: .default))
        present(ac, animated: true)
    }*/
}
