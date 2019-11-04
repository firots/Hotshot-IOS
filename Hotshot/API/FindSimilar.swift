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
        guard let data = response.data else { return }
        let decoder = JSONDecoder()
        var result = FindSimilarResult(error: false, celebs: [Celebrity]())
        if let celebs = try? decoder.decode([Celebrity].self, from: data) {
            result.celebs = celebs
        } else {
            result.error = true
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

