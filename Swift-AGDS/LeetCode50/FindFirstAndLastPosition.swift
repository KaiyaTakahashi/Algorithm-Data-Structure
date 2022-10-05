//
//  FindFirstAndLastPosition.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-09-27.
//

import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var start1 = 0
    var end1 = nums.count - 1
    var first = -1
    
    while start1 <= end1 {
        let pivot = start1 + (end1 - start1) / 2
        if nums[pivot] >= target {
            end1 = pivot - 1
        } else {
            start1 = pivot + 1
        }
        if nums[pivot] == target { first = pivot }
    }
    var start = 0
    var end = nums.count - 1
    var last = -1
    
    while start <= end {
        let pivot = start + (end - start) / 2
        if nums[pivot] <= target {
            start = pivot + 1
        } else {
            end = pivot - 1
        }
        if nums[pivot] == target { last = pivot }
    }
    return [first,last]
}
