//
//  duplicate.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-26.
//

import Foundation

func duplicate(arr: [Int]) -> Int {
    var sort = arr.sorted { $0 > $1 }
    for i in 0..<sort.count - 1 {
        if sort[i] == sort[i + 1] {
            return sort[i]
        }
    }
    return -1
}
