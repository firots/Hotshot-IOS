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
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData, withName: "image")
        }, to: "http://3.17.157.138:5000/find_similar")
            .responseJSON { response in
                debugPrint(response)
            }
    }
}

