//
//  ViewController.swift
//  PrimeNumbers
//
//  Created by Kate on 10/04/2019.
//  Copyright © 2019 Kate. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    let primeNumbersCalculator = PrimeNumbersCalculator()
    var itemsForCollectionView:[Int] = []
    
    @IBOutlet weak var upperLimit: UITextField!
    @IBOutlet weak var primeNumbersCollectionView: UICollectionView!
    
    @IBAction func calculatePrimeNumbers (_ sender: UIButton) {
        guard let n = Int(upperLimit.text ?? "") else {
            return
        }
        upperLimit.resignFirstResponder()
        itemsForCollectionView = primeNumbersCalculator.calculatePrimeNumbers(n: n)
        primeNumbersCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primeNumbersCollectionView.delegate = self
        primeNumbersCollectionView.dataSource = self
        
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsForCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = primeNumbersCollectionView.dequeueReusableCell(withReuseIdentifier: "PrimeNumberCell", for: indexPath) as! CollectionViewCell
        cell.cellText.text = String(itemsForCollectionView[indexPath.row])
        return cell
    }
}
