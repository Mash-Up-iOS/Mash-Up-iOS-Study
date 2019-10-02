//
//  ViewController.swift
//  SearchViewer👀
//
//  Created by 이동영 on 27/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK:  - Properties
    var presenter: MainPresenterType!
    
    // MARK: IBOutlets
    @IBOutlet weak var searchResultListView: UICollectionView!
    
    // MARK:  - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupsearchResultCollectionView()
    }
    
    private func setupsearchResultCollectionView() {
        searchResultListView.register(SearchResultCell.nib,
                                      forCellWithReuseIdentifier: SearchResultCell.reuseId)
        searchResultListView.dataSource = self
        searchResultListView.delegate = self
        setupLayout()
    }
    
    private func setupLayout() {
        guard
            let layout = searchResultListView.collectionViewLayout as? UICollectionViewFlowLayout
            else { return }
        let side = UIScreen.main.bounds.width/3 - 20
        
        layout.itemSize = CGSize(width: side,
                                 height: side)
        layout.sectionInset = UIEdgeInsets(top: 15,
                                           left: 15,
                                           bottom: 15,
                                           right: 15)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
    }
    
}
// MARK: - Collection View Data Source
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return presenter.numberOfItems(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.reuseId,
                                                      for: indexPath)
        guard
            let searchResultCell = cell as? SearchResultCell
            else { return cell }
        
        let model = presenter.cellForItem(at: indexPath.item)
        searchResultCell.configure(searchResult: model)
        searchResultCell.thumnailImageView.contentMode = .scaleAspectFill
        
        return searchResultCell
    }
    
}
// MARK: - Collection View Delegate
extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        guard
            let searchResultCell = cell as? SearchResultCell
            else { return }
        let model = presenter.cellForItem(at: indexPath.item)
        searchResultCell.updateThumnail(model)
    }
    
}
