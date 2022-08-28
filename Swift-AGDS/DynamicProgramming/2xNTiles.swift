//
//  2xNTiles.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-26.
//

import Foundation

func twoXNTiles(n: Int) -> Int {
    var table = [Int](repeating: 0, count: 100)
    table[1] = 1
    table[2] = 3
    table[3] = 5
    if n < 4 {
        return table[n]
    }

    for i in 4...n + 1 {
        table[i] = table[i - 1] + table[i - 2]
    }
    print(table)
    return table[n + 1]
}
