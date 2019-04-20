//
//  Presenter.swift
//  PrimeNumbers
//
//  Created by Kate on 16/04/2019.
//  Copyright © 2019 Kate. All rights reserved.
//

import Foundation

protocol IPresenter: AnyObject {
    func item(for index: Int) -> String
    func numberOfItems() -> Int
    func showPrimeNumbers(upperLimit: String?)
    init(view: IView)
}

final class Presenter: IPresenter {
    
    private weak var view: IView?
    private let primeNumbersCalculator = PrimeNumbersCalculator()
    private var primeNumbers: [String] = []
    
    required init(view: IView) {
        self.view = view
    }
    
    func item(for index: Int) -> String {
        return primeNumbers[index]
    }
    func numberOfItems() -> Int {
        return primeNumbers.count
    }
    func showPrimeNumbers(upperLimit: String?) {
        guard let numbers = Int(upperLimit ?? "") else {
            return
        }
        primeNumbers = primeNumbersCalculator.calculatePrimeNumbers(n: numbers).map{String($0)}
        view?.updateView()
    }
}
