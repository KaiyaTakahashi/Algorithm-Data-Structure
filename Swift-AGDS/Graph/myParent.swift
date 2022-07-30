//
//  myParent.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-29.
//

import Foundation

//func myParent() {
//    let firstLine = readLine()!
//    let nodeSum = Int(String(firstLine))!
//    var arr = [Int](repeating: 0, count: nodeSum)
//    arr[0] = 1
//    var i = 1
//    var prevP = 0
//    var count = 0
//
//    while i < nodeSum + 1 {
//        let line = readLine()!.split(separator: " ")
//        let parent = Int(String(line[0]))!
//        let child = Int(String(line[1]))!
//        if count == 1 && prevP != parent{
//            // do nothing
//            arr[i + 1] = child
//            i += 2
//        } else {
//            arr[i] = child
//            i += 1
//            count = count + 1 == 2 ? 0: 1
//        }
//        print(arr)
//        prevP = parent
//    }
//    print(arr)
//}

func myParent() {
    let firstLine = readLine()!
    let nodeSum = Int(String(firstLine))!
    var arr = [Int](repeating: 0, count: nodeSum - 1)
    
    for _ in 1...nodeSum {
        let line = readLine()!.split(separator: " ")
        let parent = Int(String(line[0]))!
        let child = Int(String(line[1]))!
        if arr[child - 2] == 0 {
            arr[child - 2] = parent
        }
    }
    
    for i in arr {
        print(i)
    }
}
