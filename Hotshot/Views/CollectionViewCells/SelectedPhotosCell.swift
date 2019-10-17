//
//  SelectedPhotosCell.swift
//  Hotshot
//
//  Created by Firot on 18.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

class SelectedPhotosCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 15
        // Initialization code
    }

}
