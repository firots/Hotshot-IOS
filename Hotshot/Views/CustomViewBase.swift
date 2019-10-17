//
//  CustomViewBase.swift
//  Intimer
//
//  Created by Firot on 12.06.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation
import UIKit

class CustomViewBase: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        guard let contentView = self.fromNib() else { fatalError("View could not load from nib") }
        addSubview(contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

extension UIView {
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self))
            .loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
                return nil
        }
        return contentView
    }
}
