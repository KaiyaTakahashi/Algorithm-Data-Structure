//
//  CirclePermutation.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-27.
//

import Foundation

var circleCount = 0
func circlePermutation(arr: inout [Int], nextIndex: Int, endPoint: Int) -> Int {
    if arr[nextIndex] == endPoint {
        circleCount += 1
        arr[nextIndex] = 0
        for i in 0..<arr.count {
            if arr[i] != 0 {
                let _ = circlePermutation(arr: &arr, nextIndex: i, endPoint: i + 1)
            }
        }
    } else {
        let next = arr[nextIndex] - 1
        arr[nextIndex] = 0
        let _ = circlePermutation(arr: &arr, nextIndex: next, endPoint: endPoint)
    }
    return circleCount
}

func circlePermutation(arr: inout [Int]) -> Int {
    return circlePermutation(arr: &arr, nextIndex: 0, endPoint: 1)
}
