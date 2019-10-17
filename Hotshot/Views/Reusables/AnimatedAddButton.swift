//
//  AnimatedAddButton.swift
//  Hotshot
//
//  Created by Firot on 17.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

class AnimatedAddButton: CustomViewBase {
    @IBOutlet weak var button: UIButton!
    weak var delegate: AnimatedAddButtonDelegate?
    @IBOutlet var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.animatedAddButtonTapped()
    }
}

protocol AnimatedAddButtonDelegate: class {
    func animatedAddButtonTapped()
}
