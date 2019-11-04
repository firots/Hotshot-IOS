//
//  ApiTest.swift
//  Hotshot
//
//  Created by Firot on 3.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation
import Alamofire

final class HotshotAPI {
    weak var delegate: HotshotAPIDelegate?
    static let apiAdress = "http://3.133.153.120:5000"
    
    enum RequestAdress: String {
        case findSimilar = "/find_similar"
    }
}

protocol HotshotAPIDelegate: class {
    func findSimilar(_ result: FindSimilarResult)
}

extension HotshotAPIDelegate {
    func findSimilar(_ result: FindSimilarResult) { }
}
