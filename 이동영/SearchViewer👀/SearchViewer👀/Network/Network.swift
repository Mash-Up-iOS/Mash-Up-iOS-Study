//
//  Network.swift
//  SearchViewer👀
//
//  Created by 이동영 on 28/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkType {
    
    func request(query: String, completion: @escaping (Result<Data,Error>) -> Void )
    func fetchImage(url: URL, completion: @escaping (Result<UIImage, Error>) -> Void )
}
