//
//  CollectionViewCellModelBase.swift
//  Hotshot
//
//  Created by Firot on 18.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation

protocol CollectionViewCellModel {
    var style: CollectionViewCellModelTypes { get }
    var nameTag: String { get set }
    var selectAction: (() -> Void)? { get set }
    var selectable: Bool { get set }
}

enum CollectionViewCellModelTypes {
    case selectedPhoto
}
