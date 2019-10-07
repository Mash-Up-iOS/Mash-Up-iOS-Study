//
//  ViewController.swift
//  SearchViewr
//
//  Created by Cloud on 25/09/2019.
//  Copyright © 2019 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            initCollectionView()
        }
    }
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    @IBOutlet var tapGesture: UITapGestureRecognizer! {
        didSet {
            tapGesture.delegate = self
        }
    }
    
    //MARK: - Properties
    let cellIdentifier: String = "collectionViewCell"
    var requestedImage: Image = Image()
    
    // MARK: - Init
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNotification(_:)), name: receiveNotificationName, object: nil)
    }

    // MARK: - Handlers
    @objc
    func receiveNotification(_ notification: Notification) {
        guard let image = notification.userInfo?["Image"] as? Image else { return }
        requestedImage = image
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func initCollectionView() {
        let nib: String = "ImageCollectionViewCell"
        let collectionViewCellNib: UINib = UINib(nibName: nib, bundle: nil)
        collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        guard let text = textField.text else { return }
        requestURL(search: text)
    }
}
// MARK: - UICollectionView
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return requestedImage.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        let image = requestedImage.items[indexPath.item]
        cell.configure(url: image.thumbnail, text: image.title)
        cell.backgroundColor = .darkGray
        print(cell.layer.frame)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let fullWidth = view.frame.width
        let item = requestedImage.items[indexPath.item]
        let width = Double(item.sizewidth)
        let height = Double(item.sizeheight)
        return CGSize(width: width!, height: height!)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

// MARK: - TextField
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text {
            requestURL(search: text)
        }
        return true
    }
}


// MARK: - TapGesture
extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        view.endEditing(true)
        return true
    }
}
