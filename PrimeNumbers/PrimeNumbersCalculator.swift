//
//  PrimeNumbersCalculator.swift
//  PrimeNumbers
//
//  Created by Kate on 10/04/2019.
//  Copyright © 2019 Kate. All rights reserved.
//

import Foundation
class PrimeNumbersCalculator {
    
    func calculatePrimeNumbers (n: Int) -> [Int] {
        guard n >= 2 else {
            return []
        }
        var array = Array(repeating: true, count: n + 1)
        var resultArray: [Int] = []
        for p in 2...n
        {
            if array[p]
            {
                resultArray.append(p)
                for j in stride(from: p * p, through: n, by: p)
                {
                    array[j] = false
                }
            }
        }
        return resultArray
    }
}
