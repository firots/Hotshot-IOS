//
//  HasCollectionViewDataSource.swift
//  Hotshot
//
//  Created by Firot on 17.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

protocol HasCollectionViewDataSource: class {
    var collectionViewDataSource: CollectionViewDataSource! { get  set }
    var collectionView: UICollectionView! { get set }
    func dataChanged()
}

extension HasCollectionViewDataSource {
    func dataChanged() {
        guard let collectionViewDataSource = collectionViewDataSource else { return }
        collectionViewDataSource.dataChanged?()
    }
    
    func loadDataSource() {
        if let collectionViewDataSource = self.collectionViewDataSource {
            collectionView.dataSource = collectionViewDataSource
            
            collectionViewDataSource.dataChanged =  { [weak self] in
                self?.collectionView?.reloadData()
            }
            
            if let vc = self as? CollectionViewCellDelegate {
                collectionViewDataSource.collectionViewCellDelegate = vc
            }
        }
    }
}

protocol CollectionViewDataSource: class, UICollectionViewDataSource {
    var dataChanged: (() -> Void)? { get set }
    var collectionViewCellDelegate: CollectionViewCellDelegate? { get set }
}

protocol CollectionViewCellDelegate {
    
}
