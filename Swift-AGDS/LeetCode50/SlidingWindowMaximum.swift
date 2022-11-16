//
//  SlidingWindowMaximum.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-11-14.
//

import Foundation

fileprivate struct Node: Comparable, Hashable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.val < rhs.val
    }
    
    let val: Int
    let index: Int
    
}

//func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//    var pq = IndexPriorityQueue<Node>(>)
//    var ans = [Int](repeating: 0, count: nums.count - k + 1)
//    for i in 0..<k {
//        pq.enqueue(Node(val: nums[i], index: i))
//    }
//    for i in 0..<nums.count - k + 1 {
//        var stop = false
//        while !stop {
//            let popped = pq.dequeue()!
//
//            if popped.index >= i && popped.index < i + k {
//                ans[i] = popped.val
//                stop = true
//                if popped.index >= i + 1 && popped.index < i + k + 1 {
//                    pq.enqueue(popped)
//                }
//            }
//        }
//        if i + k < nums.count {
//            pq.enqueue(Node(val: nums[i + k], index: i + k))
//        }
//    }
//    return ans
//}

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var queue = [Int]()
    var ans = [Int]()
    for i in 0..<k - 1 {
        while !queue.isEmpty && nums[queue[queue.count - 1]] < nums[i] {
            queue.removeLast()
        }
        queue.append(i)
    }
    for i in k - 1..<nums.count {
        while !queue.isEmpty && nums[queue[queue.count - 1]] < nums[i] {
            queue.removeLast()
        }
        queue.append(i)
        if queue[0] < i - k + 1 {
            queue.removeFirst()
        }
        ans.append(nums[queue[0]])
    }
    return ans
}
