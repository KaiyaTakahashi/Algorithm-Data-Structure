//
//  MaximumProductSubarray.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-11-01.
//

import Foundation

func maxProduct(_ nums: [Int]) -> Int {
    var memoise = [(absoluteValue:Int, normalValue:Int)](repeating: (Int.min, Int.min), count: nums.count)
    memoise[0].absoluteValue = nums[0]
    memoise[0].normalValue = nums[0]
    for i in 1..<nums.count {
        let num1 = memoise[i - 1].normalValue * nums[i]
        let num2 = memoise[i - 1].absoluteValue * nums[i]
        if num1 > num2 && num1 > nums[i] {
            memoise[i].normalValue = num1
            if num2 > nums[i] {
                memoise[i].absoluteValue = nums[i]
            } else {
                memoise[i].absoluteValue = num2
            }
        } else if num2 > num1 && num2 > nums[i] {
            memoise[i].normalValue = num2
            if num1 > nums[i] {
                memoise[i].absoluteValue = nums[i]
            } else {
                memoise[i].absoluteValue = num1
            }
        } else if num1 == num2 && num1 > nums[i] {
            memoise[i].normalValue = num2
            memoise[i].absoluteValue = nums[i]
        } else {
            memoise[i].normalValue = nums[i]
            if num2 > num1 {
                memoise[i].absoluteValue = num1
            } else {
                memoise[i].absoluteValue = num2
            }
        }
    }
    var max = Int.min
    for i in 0..<memoise.count {
        if memoise[i].absoluteValue > max {
            max = memoise[i].absoluteValue
        }
        if memoise[i].normalValue > max {
            max = memoise[i].normalValue
        }
    }
    return max
}
