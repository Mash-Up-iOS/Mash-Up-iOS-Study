//
//  ViewController.swift
//  SearchViewr
//
//  Created by Cloud on 25/09/2019.
//  Copyright © 2019 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nib: String = "ImageCollectionViewCell"
            let collectionViewCellNib: UINib = UINib(nibName: nib, bundle: nil)
            collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: cellIdentifier)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    //MARK: - Properties
    var images: [UIImage?] = []
    let cellIdentifier: String = "collectionViewCell"
    
    // MARK: - Handlers

}

// MARK: - UICollectionView
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(cellImage: images[indexPath.item] ?? UIImage())
        cell.backgroundColor = .darkGray
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let fullWidth = view.frame.width
        let width = ( fullWidth - 5.0 ) / 2.0
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}
