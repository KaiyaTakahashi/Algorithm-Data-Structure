//
//  ArithmeticSlices.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-09-20.
//

import Foundation

func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
    if nums.count < 2 {
        return 0
    }
    var memoise = [Int](repeating: 0, count: nums.count)
    var dif = nums[0] - nums[1]
    var count = 1
    var addition = 2
    for i in 1..<memoise.count - 1 {
        if dif == nums[i] - nums[i + 1] {
            memoise[i + 1] = count
            count += addition
            addition += 1
        } else {
            dif = nums[i] - nums[i + 1]
            count = 1
            addition = 2
        }
    }
    var total = 0
    for i in 0..<memoise.count - 1 {
        if memoise[i + 1] == 0 {
            total += memoise[i]
        }
    }
    total += memoise[memoise.count - 1]
    return total
}
