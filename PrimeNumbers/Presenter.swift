//
//  Presenter.swift
//  PrimeNumbers
//
//  Created by Kate on 16/04/2019.
//  Copyright © 2019 Kate. All rights reserved.
//

import Foundation
import UIKit

protocol IPresenter {
    func giveItemToShow (index: Int) -> String
    func setNumberOfItems() -> Int
    func showPrimeNumbers(upperLimit: String?)
}

class Presenter: IPresenter {
    
    weak var view: IView?
    private let primeNumbersCalculator = PrimeNumbersCalculator()
    private var primeNumbers:[String] = []
    
    
    func giveItemToShow (index: Int) -> String {
        return primeNumbers[index]
    }
    func setNumberOfItems() -> Int {
        return primeNumbers.count
    }
    func showPrimeNumbers(upperLimit: String?) {
        guard let n = Int(upperLimit ?? "") else {
            return
        }
        primeNumbers = primeNumbersCalculator.calculatePrimeNumbers(n: n).map{String($0)}
        view?.updateView()
    }
    
    init(view: IView) {
        self.view = view
    }
    
}
