//
//  PrettyNumber.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-09-10.
//

import Foundation

func prettyNumber(digits: Int) {
    var memoise = [[Int]](repeating: [Int](repeating: 0, count: 10), count: digits)
    for i in 1..<10 {
        memoise[0][i] = 1
    }

    print(memoise)
}
