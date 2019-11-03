//
//  NSMutableAttributedString+SetAttr.swift
//  Hotshot
//
//  Created by Firot on 3.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation

extension String {
    func setAttr(words: [String: [NSAttributedString.Key: Any]]) -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: self)
        for word in words {
            let range = NSString(string: self).range(of: word.key)
            attrString.addAttributes(word.value, range: range)
        }
        return attrString
    }
}
