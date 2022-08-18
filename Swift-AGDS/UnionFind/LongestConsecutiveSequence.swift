//
//  LongestConsecutiveSequence.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-17.
//

import Foundation

func longestConsecutive(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var set = Set<Int>()
    for i in nums {
        set.insert(i)
    }
    var sort = [Int]()
    while !set.isEmpty {
        sort.append(set.popFirst()!)
    }
    sort = sort.sorted()
    
    if sort[0] < 0 {
        let absNum = sort[0] * -1
        sort = sort.map { $0 + absNum }
    } else {
        let absNum = sort[0]
        sort = sort.map { $0 - absNum }
    }
    var uf = UF(sort.count)
    for i in 0..<sort.count - 1 {
        if sort[i] - sort[i + 1] == -1 {
            uf.union(i, i + 1)
        }
    }
    var biggest = 0
    for i in 0..<sort.count {
        if biggest < uf.getSize(at: i) {
            biggest = uf.getSize(at: i)
        }
    }
    return biggest
}
