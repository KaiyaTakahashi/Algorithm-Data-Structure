//
//  lcs.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-26.
//

import Foundation

func lcs() -> Int {
    let first = String(readLine()!)
    let second = String(readLine()!)
    var set1 = Set<String>()
    var set2 = Set<String>()
    for i in 0..<first.count {
        set1.insert(first[i])
    }
    for i in 0..<second.count {
        set2.insert(second[i])
    }
    print(set1)
    print(set2)
    return set1.intersection(set2).count
}
