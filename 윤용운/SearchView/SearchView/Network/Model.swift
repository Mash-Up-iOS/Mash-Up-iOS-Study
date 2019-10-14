//
//  Model.swift
//  SearchView
//
//  Created by Cloud on 2019/10/14.
//  Copyright © 2019 Cloud. All rights reserved.
//

import Foundation

struct Item {
   
    let link: String
    let sizeheight: String
    let sizewidth: String
    let thumbnail: String
    let title: String


    init(json: [String: Any]) {
        title = json["title"] as? String ?? ""
        thumbnail = json["thumbnail"] as? String ?? ""
        link = json["link"] as? String ?? ""
        sizewidth = json["sizewidth"] as? String ?? ""
        sizeheight = json["sizeheight"] as? String ?? ""
    }
}
