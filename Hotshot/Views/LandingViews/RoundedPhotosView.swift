//
//  RoundedPhotosView.swift
//  Hotshot
//
//  Created by Firot on 1.11.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import UIKit

final class RoundedPhotosView: CustomViewBase {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var imageStack: UIStackView!
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: RoundedPhotosViewDelegate?

    override func awakeFromNib() {
        view.layer.cornerRadius = 32
        view.clipsToBounds = true
    }
    
    func add(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageStack.addArrangedSubview(imageView)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        delegate?.addTapped()
    }
    
    func remove(image: UIImage) {
        
    }
    
    func remove(id: Int) {
        
    }
    
    func images() -> [UIImage] {
        var images = [UIImage]()
        for view in imageStack.subviews {
            if let imageView = view as? UIImageView, let image =  imageView.image {
                images.append(image)
            }
        }
        return images
    }
}

protocol RoundedPhotosViewDelegate: class {
    func addTapped()
}
