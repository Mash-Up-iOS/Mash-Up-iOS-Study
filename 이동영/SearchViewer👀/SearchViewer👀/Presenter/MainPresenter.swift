//
//  MainPresenter.swift
//  SearchViewer👀
//
//  Created by 이동영 on 28/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

// MARK: - MainPresenterType
protocol MainPresenterType {
    
    func numberOfItems(section: Int) -> Int
    func cellForItem (at index: Int) -> SearchResult
}

// MARK: - MainPresenter
class MainPresenter: MainPresenterType {
    
    // MARK: Properties
    private var model: SearchResultRepository
    
    // MARK: Methods
    init(model: SearchResultRepository) {
        self.model = model
    }
    
    func numberOfItems(section: Int) -> Int {
        return model.searchResults.count
    }
    
    func cellForItem(at index: Int) -> SearchResult {
        return model.searchResults[index]
    }
    
}
