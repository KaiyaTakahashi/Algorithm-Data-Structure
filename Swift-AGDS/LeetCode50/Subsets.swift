//
//  Subsets.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-12-06.
//

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    var ans = [[Int]]()
    
    func dfs(current: [Int], subset: [Int]) {
        if (current.isEmpty) {
            ans.append(subset)
            return
        } else {
            var newCurrent = current
            var newSubset = subset
            let first = current[0]
            newCurrent.removeFirst()
            dfs(current: newCurrent, subset: newSubset)
            newSubset.append(first)
            dfs(current: newCurrent, subset: newSubset)
        }
    }
    dfs(current: nums, subset: [Int]())
    return ans
}
