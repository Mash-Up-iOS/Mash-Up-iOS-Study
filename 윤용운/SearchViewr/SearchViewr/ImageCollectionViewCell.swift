//
//  ImageCollectionViewCell.swift
//  SearchViewr
//
//  Created by Cloud on 25/09/2019.
//  Copyright © 2019 Cloud. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(cellImage: UIImage) {
        imageView.contentMode = .scaleAspectFill
        imageView.image = cellImage
    }
}
