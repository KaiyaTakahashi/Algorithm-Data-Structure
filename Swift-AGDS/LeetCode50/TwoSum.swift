//
//  TwoSum.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-10-06.
//

import Foundation

//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    if nums.count == 2 {
//        return [0, 1]
//    }
//    var sortedNums = nums.sorted()
//    var index = 0
//    var start: Int
//    var end: Int
//    var middle = 0
//    var isFound = false
//    while index != sortedNums.count - 2 {
//        start = index + 1
//        end = sortedNums.count - 1
//        while start <= end {
//            middle = start + (end - start) / 2
//            if target - sortedNums[index] == sortedNums[middle] {
//                start = 1
//                end = 0
//                isFound = true
//            } else if sortedNums[middle] > target - sortedNums[index] {
//                end = middle - 1
//            } else {
//                start = middle + 1
//            }
//        }
//        if isFound {
//            print(index)
//            print(sortedNums[index])
//            print(sortedNums[middle])
//            print(middle)
//            return [nums.firstIndex(of: sortedNums[index])!, nums.lastIndex(of: sortedNums[middle])!]
//        }
//        index += 1
//    }
//    return [nums.firstIndex(of: sortedNums[sortedNums.count - 2])!, nums.lastIndex(of: sortedNums[sortedNums.count - 1])!]
//}

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for i in 0..<nums.count {
        if map[target - nums[i]] != nil {
            return [map[target - nums[i]]!, i]
        }
        map[nums[i]] = i
    }
    return []
}
