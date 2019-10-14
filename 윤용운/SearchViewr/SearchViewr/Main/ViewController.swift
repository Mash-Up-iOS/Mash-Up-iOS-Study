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
            delegateCollectionView()
            registerCollectionView()
            initCollectionViewFlowLayout()
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
    
    // MARK: - Handlers
    @objc func receiveNotification(_ notification: Notification) {
        guard let image = notification.userInfo?["Image"] as? Image else { return }
        requestedImage = image
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func delegateCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func initCollectionViewFlowLayout() {
        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            return layout
        }()
        collectionView.collectionViewLayout = layout
    }
    
    func registerCollectionView() {
        let nib: String = "ImageCollectionViewCell"
        let collectionViewCellNib: UINib = UINib(nibName: nib,
                                                 bundle: nil)
        collectionView.register(collectionViewCellNib,
                                forCellWithReuseIdentifier: cellIdentifier)
    }

    @IBAction func searchAction(_ sender: UIButton) {
        guard let text = textField.text else { return }
        requestURL(search: text) { image in
            self.requestedImage = image
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionView
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return requestedImage.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                            for: indexPath) as? ImageCollectionViewCell else {
                                                                return UICollectionViewCell()
                                                                
        }
        let image = requestedImage.items[indexPath.item]
        cell.configure(url: image.thumbnail,
                       text: image.title)
        return cell
    }
}

// collectionview layout은 delegate로 하면 호출 안됨. 꼭 extension delegateflowlayout.
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        let height = collectionView.bounds.height
        return CGSize(width: width,
                      height: height)
    }
}

// MARK: - TextField
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text {
            requestURL(search: text) { image in
                self.requestedImage = image
                self.collectionView.reloadData()
            }
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
