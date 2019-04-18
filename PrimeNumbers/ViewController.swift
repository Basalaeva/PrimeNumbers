//
//  ViewController.swift
//  PrimeNumbers
//
//  Created by Kate on 10/04/2019.
//  Copyright © 2019 Kate. All rights reserved.
//

import UIKit

protocol IView: AnyObject {
    func updateView()
}

final class ViewController: UIViewController, IView {
    
    lazy var presenter: IPresenter = Presenter(view: self)
    
    @IBOutlet weak var upperLimit: UITextField!
    @IBOutlet weak var primeNumbersCollectionView: UICollectionView!
    
    @IBAction func didTapCalculateButton(_ sender: UIButton) {
        
        upperLimit.resignFirstResponder()
        presenter.showPrimeNumbers(upperLimit: upperLimit.text)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primeNumbersCollectionView.delegate = self
        primeNumbersCollectionView.dataSource = self
        
    }
    
    func updateView() {
        primeNumbersCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = primeNumbersCollectionView.dequeueReusableCell(withReuseIdentifier: "PrimeNumberCell", for: indexPath) as? CollectionViewCell else {
            assertionFailure("Can't cast to PrimeNumberCell")
            return UICollectionViewCell()
        }
        cell.configure(with: presenter.item(for: indexPath))
        return cell
    }
}
