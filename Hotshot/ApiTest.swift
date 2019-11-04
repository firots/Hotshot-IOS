//
//  ApiTest.swift
//  Hotshot
//
//  Created by Firot on 3.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation
import Alamofire

class ApiTest {
    static func findSimilar(image: UIImage) {
        guard let imgData = image.jpegData(compressionQuality: 1.0) else { return }
        let imgName = "\(UUID.init().uuidString).jpeg"
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData, withName: "image", fileName: imgName, mimeType: "image/jpeg")
            }, to: "http://3.133.138.109:5000/find_similar"
        )
            .responseJSON { response in
                debugPrint(response)
            }
    }
}

