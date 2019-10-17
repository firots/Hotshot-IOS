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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedPhotosCell", for: indexPath) as! SelectedPhotosCell
        cell.imageView.image = UIImage(named: "firad.jpg")
        return cell
    }
}
