//
//  SearchResultCell.swift
//  SearchViewer👀
//
//  Created by 이동영 on 28/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    // MARK: Properties
    static let nib = UINib(nibName: URL(fileURLWithPath: #file).fileName,
                           bundle: .main)
    static let reuseId = URL(fileURLWithPath: #file).fileName
    
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumnailImageView: UIImageView!
    
    // MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(searchResult: SearchResult) {
        titleLabel.text = searchResult.title
    }
    
    func updateThumnail(image: UIImage?) {
        guard
            let image = image
            else { return }
        thumnailImageView.image = image
    }
    
}
