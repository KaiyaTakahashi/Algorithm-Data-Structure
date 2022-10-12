//
//  ThreeSum.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-10-05.
//

import Foundation

//func threeSum(_ nums: [Int]) -> [[Int]] {
//    if nums.count < 3 {
//        return []
//    }
//    var ans = [[Int]]()
//    var duplicate = false
//    var threeZero = false
//    for i in 0..<nums.count - 2 {
//        for j in (i + 1)..<nums.count - 1 {
//            for k in (j + 1)..<nums.count {
//                if nums[i] + nums[j] + nums[k] == 0 {
//                    if ans.isEmpty {
//                        ans.append([nums[i], nums[j], nums[k]])
//                        if nums[i] == 0 && nums[j] == 0 && nums[k] == 0 {
//                            threeZero = true
//                        }
//                    }
//                    if !threeZero && nums[i] == 0 && nums[j] == 0 && nums[k] == 0 {
//                        ans.append([0, 0, 0])
//                        threeZero = true
//                    }
//                    duplicate = false
//                    for arr in ans {
//                        if arr.contains(nums[i]) && arr.contains(nums[j]) && arr.contains(nums[k]) {
//                            duplicate = true
//                        }
//                    }
//                    if !duplicate {
//                        ans.append([nums[i], nums[j], nums[k]])
//                    }
//                }
//            }
//        }
//    }
//    return ans
//}

func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    var ans = Set<[Int]>()
    var pos = [Int]()
    var neg = [Int]()
    var zero = [Int]()
    for i in nums {
        if i > 0 {
            pos.append(i)
        } else if i < 0 {
            neg.append(i)
        } else {
            zero.append(i)
        }
    }
    if zero.count > 2 && neg.count == 0 && pos.count == 0 {
        return [[0, 0, 0]]
    }
    if pos.count == 0 || neg.count == 0 {
        return []
    }
    
    pos = pos.sorted()
    neg = neg.sorted { return $0 > $1 }

    var answer = [[Int]]()
    // when 0 zero
    // (neg, neg, pos)
    
    for i in 0..<neg.count - 1 {
        for j in (i + 1)..<neg.count {
            var start = 0
            var end = pos.count - 1
            var negSum = abs(neg[i]) + abs(neg[j])
            var middle = 0
            var isMatched = false
            while end >= start {
                middle = start + (end - start) / 2
                if pos[middle] > negSum {
                    end = middle - 1
                } else if pos[middle] < negSum {
                    start = middle + 1
                } else {
                    end = 0
                    start = 1
                    isMatched = true
                }
            }
            if isMatched {
                ans.insert([neg[i], neg[j], pos[middle]])
            }
        }
    }
    // (pos, pos, neg)
    for i in 0..<pos.count - 1 {
        for j in (i + 1)..<pos.count {
            
            var start = 0
            var end = neg.count - 1
            var posSum = abs(pos[i]) + abs(pos[j])
            var middle = 0
            var isMatched = false
            while end >= start {
                middle = start + (end - start) / 2
                if -(neg[middle]) > posSum {
                    end = middle - 1
                } else if -(neg[middle]) < posSum {
                    start = middle + 1
                } else {
                    end = 0
                    start = 1
                    isMatched = true
                }
            }
            if isMatched {
                ans.insert([pos[i], pos[j], neg[middle]])
            }
        }
    }
    if zero.count == 0 {
        while !ans.isEmpty {
            answer.append(ans.popFirst()!)
        }
        return answer
    }
    // (pos, neg, 0)
    for i in pos {
        for j in neg {
            if abs(i) == abs(j) {
                ans.insert([0, i, j])
            }
        }
    }
    if zero.count > 2 {
        ans.insert([0, 0, 0])
    }
    
    while !ans.isEmpty {
        answer.append(ans.popFirst()!)
    }
    return answer
}
