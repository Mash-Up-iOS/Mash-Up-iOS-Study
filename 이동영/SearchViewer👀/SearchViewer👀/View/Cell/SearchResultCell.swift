//
//  SearchResultCell.swift
//  SearchViewer👀
//
//  Created by 이동영 on 28/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {

    // MARK: - Properties
    static let nib = UINib(nibName: URL(fileURLWithPath: #file).fileName,
                           bundle: .main)
    static let reuseId = URL(fileURLWithPath: #file).fileName
    
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.backgroundColor = .cyan
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        thumnailImageView.contentMode = .scaleAspectFill
        thumnailImageView.image = #imageLiteral(resourceName: "default")
        loadingIndicator.style = .large
    }
    
    override func prepareForReuse() {
        thumnailImageView.image = #imageLiteral(resourceName: "default")
    }
    
    func configure(searchResult: SearchResult) {
        titleLabel.text = searchResult.title
        updateThumnail(searchResult)
    }
    
    func updateThumnail(_ thumnailInfo: SearchResult) {
        if let image = thumnailInfo.thumnailImage {
            thumnailImageView.image = image
            loading(on: false)
            return
        }
        loading(on: true)
        NetworkStub.fetchImage(url: thumnailInfo.imageUrl) {
            [weak self] result in
            switch result {
            case .success(let image):
                self?.loading(on: false)
                self?.thumnailImageView.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return
    }
    
    private func loading(on: Bool) {
        if on {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
        loadingIndicator.isHidden  = !on
    }
    
}
