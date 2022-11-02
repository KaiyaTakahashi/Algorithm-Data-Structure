//
//  TopKFrequentElements.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-10-25.
//

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var copy = nums
    var dic = [Int: Int]()
    while !copy.isEmpty {
        let num = copy.removeFirst()
        if dic[num] == nil {
            dic[num] = 1
        } else {
            dic[num]! += 1
        }
    }
    let sortedDic = dic.sorted { $0.value > $1.value }
    var ans = [Int]()
    for i in 0..<k {
        ans.append(sortedDic[i].key)
    }
    return ans
}

//func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
//    var copy = nums
//    var dic = [Int: Int]()
//    while !copy.isEmpty {
//        let num = copy.removeFirst()
//        if dic[num] == nil {
//            dic[num] = 1
//        } else {
//            dic[num]! += 1
//        }
//    }
//    var bucket = [[Int]](repeating: [], count: nums.count + 1)
//    for d in dic {
//        bucket[d.value].append(d.key)
//    }
//    var ans = [Int]()
//    var index = bucket.count - 1
//    while ans.count != k {
//        for i in 0..<bucket[index].count {
//            ans.append(bucket[index][i])
//        }
//        index -= 1
//    }
//    return ans
//}
