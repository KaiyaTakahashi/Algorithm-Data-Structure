//
//  LenghtOfLIS.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-09-09.
//

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
    var memoise = [Int](repeating: 1, count: nums.count)
    for i in stride(from: nums.count - 1, to: -1, by: -1) {
        for j in i..<nums.count {
            if i != j && nums[i] < nums[j] && memoise[i] < memoise[j] + 1 {
                memoise[i] = memoise[j] + 1
            }
        }
    }
    return memoise.max()!
}

