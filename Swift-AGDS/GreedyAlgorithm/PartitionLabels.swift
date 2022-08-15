//
//  PartitionLabels.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-14.
//

import Foundation

func partitionLabels(_ s: String) -> [Int] {
    var sumArr = [Int]()
    
    var lastIndecies = [Int](repeating: -1, count: 26)
    for i in (0..<s.count).reversed() {
        if lastIndecies[Int(Character(String(s[i])).asciiValue!) - 97] == -1 {
            lastIndecies[Int(Character(String(s[i])).asciiValue!) - 97] = i
        }
    }
    var start = 0
    var end = 0
    for i in 0..<s.count {
        end = max(end, lastIndecies[Int(Character(String(s[i])).asciiValue!) - 97])
        if i == end {
            sumArr.append(end - start + 1)
            if i != s.count - 1 {
                start = i + 1
                end = lastIndecies[Int(Character(String(s[i + 1])).asciiValue! - 97)]
            }
        }
    }
    
    return sumArr
}

//func partitionLabels(_ s: String) -> [Int] {
//    var finish = false
//    var startChar = s[0]
//    var sumArr = [Int]()
//    while !finish {
//        var startIndex = 0
//        while s[startIndex] != startChar {
//            startIndex += 1
//        }
//        var lastOccur = s.count - 1
//        while s[lastOccur] != startChar {
//            lastOccur -= 1
//        }
//        var set = Set<Character>()
//        for i in startIndex...lastOccur {
//            set.insert(Character(String(s[i])))
//        }
//        var lastIndex = 0
//        while !set.isEmpty {
//            let checkedChar = set.popFirst()!
//            var tempIndex = s.count - 1
//            while Character(String(s[tempIndex])) != checkedChar {
//                tempIndex -= 1
//            }
//            if tempIndex > lastIndex {
//                lastIndex = tempIndex
//            }
//            if lastOccur < tempIndex {
//                for i in lastOccur + 1..<tempIndex {
//                    set.insert(Character(String(s[i])))
//                }
//            }
//        }
//        if lastIndex != s.count - 1{
//            startChar = s[lastIndex + 1]
//        } else {
//            finish = true
//        }
//        sumArr.append(lastIndex - startIndex + 1)
//
//    }
//    return sumArr
//}


