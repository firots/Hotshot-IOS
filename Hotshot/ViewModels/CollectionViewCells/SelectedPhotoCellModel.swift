//
//  SelectedPhotoCellModel.swift
//  Hotshot
//
//  Created by Firot on 18.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

final class SelectedPhotoCellModel: CollectionViewCellModel {
    var style = CollectionViewCellModelTypes.selectedPhoto
    var nameTag: String
    var selectAction: (() -> Void)?
    var selectable: Bool
    var image: UIImage?
    
    init(tag: String) {
        selectable = false
        nameTag = tag
    }
}
