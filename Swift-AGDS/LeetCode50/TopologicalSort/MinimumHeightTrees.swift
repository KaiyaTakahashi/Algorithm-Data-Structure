//
//  MinimumHeightTrees.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-10-12.
//

import Foundation

fileprivate struct Node {
    let val: Int
    let to: [Int]
    let leefNum: Int
}

func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
    if n == 2 {
        return edges[0]
    } else if n == 1 {
        return [0]
    }
    var adjList = [[Int]](repeating: [], count: n)
    for i in 0..<edges.count {
        adjList[edges[i][0]].append(edges[i][1])
        adjList[edges[i][1]].append(edges[i][0])
    }
    var indegrees = [Int](repeating: 0, count: n)
    for edge in edges {
        indegrees[edge[0]] += 1
        indegrees[edge[1]] += 1
    }
    let queue = Queue<Node>()
    for i in 0..<indegrees.count {
        if indegrees[i] == 1 {
            queue.enqueue(item: Node(val: i, to: adjList[i], leefNum: 0))
        }
    }
    var iteration = 0
    while iteration != n - 2 {
        let node = queue.dequeue()!
        indegrees[node.val] = 0
        for i in 0..<node.to.count {
            if indegrees[node.to[i]] != 0 {
                indegrees[node.to[i]] -= 1
            }
            if indegrees[node.to[i]] == 1 {
                queue.enqueue(item: Node(val: node.to[i], to: adjList[node.to[i]], leefNum: node.leefNum + 1))
            }
        }
        iteration += 1
    }
    let firstNode = queue.dequeue()!
    let secondNode = queue.dequeue()!
    if firstNode.leefNum != secondNode.leefNum {
        return [secondNode.val]
    }
    var ans = [Int]()
    for i in 0..<indegrees.count {
        if indegrees[i] == 1 {
            ans.append(i)
        }
    }
    return ans
}
