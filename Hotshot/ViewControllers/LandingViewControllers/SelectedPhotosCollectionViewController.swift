//
//  SelectedPhotosCollectionViewController.swift
//  Hotshot
//
//  Created by Firot on 16.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

class SelectedPhotosCollectionViewController: UICollectionViewController, HasCollectionViewDataSource {
    var collectionViewDataSource: CollectionViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        loadDataSource(SelectedPhotosDataSource())
    }
    
    func registerCells() {
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "SelectedPhotoCell")
    }
}
