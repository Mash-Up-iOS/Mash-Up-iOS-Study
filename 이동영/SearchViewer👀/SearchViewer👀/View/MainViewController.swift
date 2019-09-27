//
//  ViewController.swift
//  SearchViewer👀
//
//  Created by 이동영 on 27/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: MainPresenterType!
    
    // MARK: IBOutlets
    @IBOutlet weak var searchResultListView: UICollectionView!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupsearchResultCollectionView()
        searchResultListView.dataSource = self
    }
    
    private func setupsearchResultCollectionView() {
        searchResultListView.register(SearchResultCell.nib,
                                      forCellWithReuseIdentifier: SearchResultCell.reuseId)
    }
    
}
// MARK: - Collection View Data Source
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.reuseId,
            for: indexPath)
        guard
            let searchResultCell = cell as? SearchResultCell
            else { return cell }
        
        let searchResult = presenter.cellForItem(at: indexPath.item)
        searchResultCell.configure(searchResult: searchResult)
        
        return searchResultCell
    }
    
}
// MARK: - Collection
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
}
