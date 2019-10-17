//
//  CollectionViewModel.swift
//  Hotshot
//
//  Created by Firot on 18.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation

protocol CollectionViewModel {
    var title: String? { get set }
    var sections: [CollectionViewSectionModel] { get  set }
}

class CollectionViewSectionModel {
    var title: String?
    var footer: String?
    
}
