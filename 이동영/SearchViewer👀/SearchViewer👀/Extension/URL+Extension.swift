//
//  URL+Extension.swift
//  SearchViewer👀
//
//  Created by 이동영 on 28/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

extension URL {
    var fileName: String {
        return self.deletingPathExtension().lastPathComponent
    }
}
