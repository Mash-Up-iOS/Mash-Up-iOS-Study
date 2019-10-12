//
//  ViewController.swift
//  studyweek1
//
//  Created by 김혜지 on 06/10/2019.
//  Copyright © 2019 김혜지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField : UITextField!
    @IBOutlet weak var searchButton : UIButton!
    @IBOutlet var tableview : UITableView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var webImage : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "http://www.naver.com")!) { data, response, error in
            guard data != nil else{
                print("No Data")
                return
            }
            
        }
    }

//    @IBAction func tappedButton (_ sender: Any) {
//
//    }

}

extension ViewController :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableviewCell", for: indexPath)
        
        
        return cell
    }
}
