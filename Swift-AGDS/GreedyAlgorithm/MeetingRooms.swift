//
//  MeetingRooms.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-13.
//

import Foundation

func canAttendMettings(_ intervals: [[Int]]) -> Bool {
    var numArr = [Int]()
    for i in 0..<intervals.count {
        let start = intervals[i][0]
        let end = intervals[i][1]
        for i in start...end {
            if !numArr.contains(i) {
                numArr.append(i)
            } else {
                return false
            }
        }
    }
    return true
}

func canAttendMettings2(_ intervals: [[Int]]) -> Bool {
    var numArr = [[Int]]()
    for i in 0..<intervals.count {
        if numArr.isEmpty {
            numArr.append(intervals[i])
        } else {
            for j in 0..<numArr.count {
                if !(numArr[j][0] > intervals[i][0] && numArr[j][0] > intervals[i][1]) || !(numArr[j][1] < intervals[i][1] && numArr[j][0] < intervals[i][1]) {
                    return false
                }
            }
            numArr.append(intervals[i])
        }
    }
    return true
}

func canAttendMettings3(_ intervals: [[Int]]) -> Bool {
    
    return true
}
// input: [[0, 30], [5, 10], [15, 20]]
// output: false

//input: [[7,10], [2,4]]
//output: true
