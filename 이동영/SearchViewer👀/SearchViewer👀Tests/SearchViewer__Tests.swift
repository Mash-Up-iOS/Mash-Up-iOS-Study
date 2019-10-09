//
//  SearchViewer__Tests.swift
//  SearchViewer👀Tests
//
//  Created by 이동영 on 27/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import XCTest

class SearchViewer__Tests: XCTestCase {

    // Given
    let model = SearchResultRepository(searchResults: [.init(title: "test01",
                                                             imageUrl: URL(fileURLWithPath: #file))])
    lazy var presenter = MainPresenter(model: model)
    
    func testPresenter() {
        //When
        let numberOfItems = presenter.numberOfItems(section: 0)
        
        //Then
        XCTAssertEqual(numberOfItems, 1)
    }
    
}
