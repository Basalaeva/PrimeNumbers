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

class ViewController: UIViewController, IView {
    
    lazy var presenter: IPresenter = Presenter(view: self)
    
    @IBOutlet weak var upperLimit: UITextField!
    @IBOutlet weak var primeNumbersCollectionView: UICollectionView!
    
    @IBAction func didTapCalculateButton (_ sender: UIButton) {
        
        upperLimit.resignFirstResponder()
        presenter.showPrimeNumbers(upperLimit: upperLimit.text)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primeNumbersCollectionView.delegate = self
        primeNumbersCollectionView.dataSource = self
        
    }
    
    func updateView () {
        primeNumbersCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.setNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = primeNumbersCollectionView.dequeueReusableCell(withReuseIdentifier: "PrimeNumberCell", for: indexPath) as! CollectionViewCell
        cell.cellText.text = presenter.giveItemToShow(index: indexPath.row)
        return cell
    }
}
