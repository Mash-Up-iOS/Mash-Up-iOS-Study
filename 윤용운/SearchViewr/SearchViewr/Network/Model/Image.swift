//
//  Image.swift
//  SearchViewr
//
//  Created by Cloud on 30/09/2019.
//  Copyright © 2019 Cloud. All rights reserved.
//

import UIKit

struct Image: Codable {
    var lastBuildDate: String = ""
    var total: Int = 0
    var start: Int = 0
    var display: Int = 0
    var items: [item] = []
    
    struct item: Codable {
        let title: String
        let link: String
        let thumbnail: String
        let sizeheight: String
        let sizewidth: String
    }
}
