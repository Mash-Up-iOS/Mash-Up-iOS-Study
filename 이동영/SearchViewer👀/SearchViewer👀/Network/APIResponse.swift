//
//  SearchResult.swift
//  SearchViewer👀
//
//  Created by 이동영 on 28/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

// MARK: - APIResponse
struct APIResponse: Codable {
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let thumbnail: String
    let sizeheight: String
    let sizewidth: String
}
