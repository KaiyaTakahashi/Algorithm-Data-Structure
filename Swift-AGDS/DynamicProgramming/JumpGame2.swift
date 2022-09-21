//
//  JumpGame2.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-09-21.
//

import Foundation

func jump(_ nums: [Int]) -> Int {
    if nums.count < 1 {
        return 1
    }
    var memoise = [Int](repeating: 0, count: nums.count)
    for i in stride(from: nums.count - 2, to: -1, by: -1) {
        var smallest = Int.max
        for j in 1..<nums[i] + 1 {
            if j + i < nums.count && smallest > memoise[j + i] {
                smallest = memoise[j + i]
            }
        }
        if smallest == Int.max {
            memoise[i] = Int.max
        } else {
            memoise[i] = smallest + 1
        }
    }
    return memoise[0]
}
