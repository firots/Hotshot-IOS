//
//  AnalyzingImage.swift
//  Hotshot
//
//  Created by Firot on 20.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation

final class AnalyzingImage {
    let id: UUID
    let fileName: String
    let image: UIImage
    
    init(fileName: String, image: UIImage) {
        id = UUID.init()
        self.fileName = fileName
        self.image = image
    }
}
