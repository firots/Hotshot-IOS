//
//  SelectedPhotosDataSource.swift
//  Hotshot
//
//  Created by Firot on 17.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

final class SelectedPhotosDataSource: NSObject, CollectionViewDataSource {
    var dataChanged: (() -> Void)?
    var collectionViewCellDelegate: CollectionViewCellDelegate?
    var model: CollectionViewModel {
        didSet {
            dataChanged?()
        }
    }
    
    init(model: CollectionViewModel) {
        self.model = model
        super.init()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        model.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedPhotosCell", for: indexPath) as! SelectedPhotosCell
        cell.imageView.image = UIImage(named: "firad.jpg")
        return cell
    }
}
