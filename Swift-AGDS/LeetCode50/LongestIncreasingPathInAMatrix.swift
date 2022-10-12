//
//  LongestIncreasingPathInAMatrix.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-10-08.
//

import Foundation

struct Node {
    let r: Int
    let c: Int
}

func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    let rDirection = [0, 0, 1, -1]
    let cDirection = [1, -1, 0, 0]
    var indegree = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)
    for row in 0..<matrix.count {
        for col in 0..<matrix[row].count {
            for k in 0...3 {
                let r = rDirection[k] + row
                let c = cDirection[k] + col
                if r >= 0 && r < matrix.count && c >= 0 && c < matrix[row].count {
                    if matrix[row][col] < matrix[r][c] {
                        indegree[row][col] += 1
                    }
                }
            }
        }
    }
    
    let queue = Queue<Node>()
    for row in 0..<matrix.count {
        for col in 0..<matrix[row].count {
            if indegree[row][col] == 0 {
                queue.enqueue(item: Node(r: row, c: col))
            }
        }
    }
    var map = [[Int]](repeating: [Int](repeating: 1, count: matrix[0].count), count: matrix.count)
    while !queue.isEmpty() {
        let node = queue.dequeue()!
        for i in 0..<4 {
            let row = rDirection[i] + node.r
            let col = cDirection[i] + node.c
            if row >= 0 && row < matrix.count && col >= 0 && col < matrix[row].count && matrix[row][col] < matrix[node.r][node.c] {
                indegree[row][col] -= 1
                if map[node.r][node.c] + 1 > map[row][col] {
                    map[row][col] = map[node.r][node.c] + 1
                }
                if indegree[row][col] == 0 {
                    queue.enqueue(item: Node(r: row, c: col))
                }
            }
        }
    }
    var max = 0
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j] > max {
                max = map[i][j]
            }
        }
    }

    return max
}
