//
//  ViewController.swift
//  SearchView
//
//  Created by Cloud on 2019/10/14.
//  Copyright © 2019 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var textField: UITextField! {
        didSet{
            textField.delegate = self
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.dataSource = self
            let nib: UINib = UINib(nibName: "TableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "cell")
        }
    }
    
    // MARK: - Properties
    var items: [Item] = []
    // MARk: - Init
    
    // MARK: - Handlers
    @IBAction func searchAction(_ sender: Any) {
        if let text = textField.text {
            requestURL(search: text) { item in
                self.items.append(item)
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - TableView
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.configureCell(title: item.title, image: item.thumbnail)
        return cell
    }
}

// MARK: - TextField
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text {
            requestURL(search: text) { item in
                self.items.append(item)
                self.tableView.reloadData()
            }
        }
        return true
    }
}
