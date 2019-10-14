//
//  TableViewCell.swift
//  SearchView
//
//  Created by Cloud on 2019/10/14.
//  Copyright © 2019 Cloud. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func configureCell(title: String, image: String) {
        guard let imageURL = URL(string: image) else { return }
        do {
            let imageData = try Data(contentsOf: imageURL)
            imageView?.image = UIImage(data: imageData)
        } catch let dataError {
            print(dataError.localizedDescription)
        }
        label.text = title
    }
    
}
