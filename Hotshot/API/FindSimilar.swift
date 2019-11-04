//
//  FindSimilar.swift
//  Hotshot
//
//  Created by Firot on 5.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation
import Alamofire

extension HotshotAPI {
    func findSimilar(image: UIImage) {
        guard let imgData = image.jpegData(compressionQuality: 1.0) else { return }
        let adress = HotshotAPI.apiAdress + HotshotAPI.RequestAdress.findSimilar.rawValue
        let imgName = "\(UUID.init().uuidString).jpeg"
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData, withName: "image", fileName: imgName, mimeType: "image/jpeg")
        }, to: adress
        )
            .responseJSON { response in
                self.handleFindSimilar(response)
                debugPrint(response)
            }
    }
    
    private func handleFindSimilar(_ response: AFDataResponse<Any>) {
        var result = FindSimilarResult(error: true, celebs: [Celebrity]())
        if let data = response.data, let celebs = try? JSONDecoder().decode([Celebrity].self, from: data) {
            result.error = false
            result.celebs = celebs
        }
        delegate?.findSimilar(result)
    }
}

struct Celebrity: Codable {
    let name: String
    let percentage: Int
    let rank: Int
}

struct FindSimilarResult {
    var error: Bool
    var celebs: [Celebrity]
}

