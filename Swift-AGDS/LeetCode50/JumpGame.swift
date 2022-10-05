//
//  JumpGame.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-09-21.
//

import Foundation

func canJump(_ nums: [Int]) -> Bool {
    if nums.count == 1 {
        return true
    }
    var memoise = [Bool](repeating: false, count: nums.count)
    var goal = nums.count - 1
    var start = nums.count - 2
    var finished = false
    while !finished {
        if nums[start] >= goal - start {
            memoise[start] = true
            goal = start
            start = start - 1
        } else {
            start -= 1
        }
        if start < 0 {
            finished = true
        }
    }
    return memoise[0]
}

