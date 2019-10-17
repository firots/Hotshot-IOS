//
//  SelectedPhotosViewModel.swift
//  Hotshot
//
//  Created by Firot on 18.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation

final class SelectedPhotosViewModel: CollectionViewModel {
    var title: String?
    var sections: [CollectionViewSectionModel]
    
    init() {
        sections = [CollectionViewSectionModel]()
    }
    
}
