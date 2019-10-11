//
//  ImageCollectionViewCell.swift
//  SearchViewr
//
//  Created by Cloud on 25/09/2019.
//  Copyright © 2019 Cloud. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 15
            imageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
 
    // MARK: - Handlers
    func configure(url: String, text: String) {
        guard let imageURL = URL(string: url) else { return }
        do {
            let imageData = try Data(contentsOf: imageURL)
            imageView.image = UIImage(data: imageData)
        } catch let error {
            print(error.localizedDescription)
        }
        titleLabel.text = text
    }
}
