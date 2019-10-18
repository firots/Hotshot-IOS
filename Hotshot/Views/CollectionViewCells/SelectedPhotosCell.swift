//
//  SelectedPhotosCell.swift
//  Hotshot
//
//  Created by Firot on 18.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

final class SelectedPhotosCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    var model: SelectedPhotoCellModel? {
        didSet {
            if model != nil {
                imageView.image = model?.image
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 15
    }
}
