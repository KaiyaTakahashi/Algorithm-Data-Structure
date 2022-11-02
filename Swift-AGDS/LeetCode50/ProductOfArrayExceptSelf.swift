//
//  ProductOfArrayExceptSelf.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-10-31.
//

import Foundation

//func productExceptSelf(_ nums: [Int]) -> [Int] {
//    var zeroCount = 0
//    var allProduct = 1
//    for i in 0..<nums.count {
//        if nums[i] != 0 {
//            allProduct *= nums[i]
//        } else {
//            zeroCount += 1
//        }
//    }
//    if zeroCount > 1 {
//        return [Int](repeating: 0, count: nums.count)
//    } else if zeroCount == 1 {
//        var ans = [Int](repeating: 0, count: nums.count)
//        ans[nums.lastIndex(of: 0)!] = allProduct
//        return ans
//    } else {
//        var ans = [Int]()
//        for i in 0..<nums.count {
//            if nums[i] == 0 {
//                ans.append(0)
//            } else {
//                ans.append(allProduct / nums[i])
//            }
//        }
//        return ans
//    }
//}

func productExceptSelf(_ nums: [Int]) -> [Int] {
    if nums.count < 1 {
        return nums
    }
    var leftMap = [Int](repeating: 1, count: nums.count)
    var rightMap = [Int](repeating: 1, count: nums.count)
    for i in 1..<nums.count {
        let num = leftMap[i - 1] * nums[i - 1]
        leftMap[i] = num
    }
    for i in stride(from: nums.count - 2, to: -1, by: -1) {
        let num = rightMap[i + 1] * nums[i + 1]
        rightMap[i] = num
    }
    var ans = [Int](repeating: 1, count: nums.count)
    for i in 0..<leftMap.count {
        ans[i] = leftMap[i] * rightMap[i]
    }
    return ans
}
