//
//  HouseRobber3.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-09-20.
//

import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


func rob(_ root: TreeNode?) -> Int {
    func dfs(node: TreeNode?) -> (Int, Int) {
        if node == nil {
            return (0, 0)
        } else {
            let left = dfs(node: node?.left)
            let right = dfs(node: node?.right)
            let withRoot = node!.val + left.1 + right.1
            let withoutRoot = max(left.0, left.1) + max(right.0, right.1)
            return (withRoot, withoutRoot)
        }
    }
    let result = dfs(node: root)
    return max(result.0, result.1)
}

