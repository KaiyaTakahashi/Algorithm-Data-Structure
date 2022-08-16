//
//  TaskScheduler.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-15.
//

import Foundation

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var taskArr = [Int](repeating: 0, count: 26)
    for i in 0..<tasks.count {
        taskArr[Int(Character(String(tasks[i])).asciiValue!) - 65] += 1
    }
    var taskOrder = [UnicodeScalar]()
    var count = 0
    while count != tasks.count {
        var temp = taskArr
        let max = taskArr.firstIndex(of: taskArr.max()!)!
        taskArr[max] -= 1
        let task = UnicodeScalar(65 + max)!
        temp[max] = 0
        taskOrder.append(task)
        count += 1
        for i in 0..<n {
            if count == tasks.count {
                return taskOrder.count
            } else {
                let max = temp.firstIndex(of: temp.max()!)!
                if temp.max() == 0 {
                    taskOrder.append(UnicodeScalar(126))
                } else {
                    let task = UnicodeScalar(65 + max)!
                    taskOrder.append(UnicodeScalar(65 + max)!)
                    temp[max] = 0
                    taskArr[max] -= 1
                    count += 1
                }
            }
        }
    }
    return taskOrder.count
}

func leastInterval2(_ tasks: [Character], _ n: Int) -> Int {
    var taskArr = [Int](repeating: 0, count: 26)
    for i in 0..<tasks.count {
        taskArr[Int(Character(String(tasks[i])).asciiValue!) - 65] += 1
    }
    return 0
    var count = 0
    while count == tasks.count {
        
    }
}
