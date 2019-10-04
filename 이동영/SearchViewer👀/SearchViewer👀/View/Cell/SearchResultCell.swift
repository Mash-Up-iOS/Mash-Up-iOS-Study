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
    static let nib = UINib(nibName: URL.currentFileName,
                           bundle: .main)
    static let reuseId = URL.currentFileName
    
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        thumnailImageView.contentMode = .scaleAspectFill
        thumnailImageView.image = #imageLiteral(resourceName: "default")
        setAutoLayout()
    }
    
    override func prepareForReuse() {
        self.thumnailImageView.image = nil
    }
    
    private func setAutoLayout() {
        let constraints = [
            titleLabel
                .topAnchor
                .constraint(equalToSystemSpacingBelow: self.contentView.topAnchor,
                            multiplier: 0),
            titleLabel
                .leadingAnchor
                .constraint(equalToSystemSpacingAfter: self.contentView.leadingAnchor,
                            multiplier: 0),
            titleLabel
                .trailingAnchor
                .constraint(equalToSystemSpacingAfter: self.contentView.trailingAnchor,
                            multiplier: 0),
            thumnailImageView
                .topAnchor
                .constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor,
                            multiplier: 0),
            thumnailImageView
                .leadingAnchor
                .constraint(equalToSystemSpacingAfter: self.contentView.leadingAnchor,
                            multiplier: 0),
            thumnailImageView
                .trailingAnchor
                .constraint(equalToSystemSpacingAfter: self.contentView.trailingAnchor,
                            multiplier: 0),
            thumnailImageView
                .bottomAnchor
                .constraint(equalToSystemSpacingBelow: self.contentView.bottomAnchor,
                            multiplier: 0),
            loadingIndicator
                .centerXAnchor
                .constraint(equalToSystemSpacingAfter: thumnailImageView.centerXAnchor
                    , multiplier: 0),
            loadingIndicator
                .centerYAnchor
                .constraint(equalToSystemSpacingBelow: thumnailImageView.centerYAnchor,
                            multiplier: 0),
            loadingIndicator
                .widthAnchor
                .constraint(equalTo: thumnailImageView.widthAnchor,
                            multiplier: 0),
            loadingIndicator
                .heightAnchor
                .constraint(equalTo: loadingIndicator.widthAnchor,
                            multiplier: 0),
            loadingIndicator
                .centerXAnchor
                .constraint(equalToSystemSpacingAfter: self.contentView.centerXAnchor,
                            multiplier: 0),
            loadingIndicator
                .centerYAnchor
                .constraint(equalToSystemSpacingBelow: self.contentView.centerYAnchor,
                            multiplier: 0)
        ]
        NSLayoutConstraint.activate(constraints)
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
