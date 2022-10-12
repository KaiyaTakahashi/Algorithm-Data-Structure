//
//  TrappingRainWater.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-09-22.
//

import Foundation

//func trap(_ height: [Int]) -> Int {
//    var max = height.max()!
//    var map = height
//    var water = 0
//    while max != 0 {
//        var tempMap = [Int](repeating: 0, count: height.count)
//        for i in 0..<height.count {
//            if map[i] > 0 {
//                map[i] -= 1
//                tempMap[i] = 1
//            }
//        }
//        max -= 1
//        var start = false
//        var count = 0
//        for i in 0..<height.count {
//            if tempMap[i] == 1 && start == false{
//                start = true
//            } else if tempMap[i] == 1 && start == true {
//                water += count
//                count = 0
//            }
//            if start && tempMap[i] == 0 {
//                count += 1
//            }
//        }
//    }
//    return water
//}

func trap(_ height: [Int]) -> Int {
    var map = height
    var water = 0
    for _ in 0..<height.max()! {
        var start = false
        var count = 0
        for i in 0..<height.count {
            if map[i] != 0 && start == false{
                start = true
            } else if map[i] != 0 && start == true {
                water += count
                count = 0
            }
            if start && map[i] == 0 {
                count += 1
            }
            if map[i] != 0 {
                map[i] -= 1
            }
        }
    }
    return water
}
