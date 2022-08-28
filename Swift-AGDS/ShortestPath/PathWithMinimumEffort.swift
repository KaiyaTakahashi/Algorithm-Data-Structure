//
//  PathWithMinimumEffort.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-24.
//

import Foundation

func minimumEffortPath(_ heights: [[Int]]) -> Int {
    struct Node {
        let row: Int
        let col: Int
    }
    let rowD = [0, 1, 0, -1]
    let colD = [1, 0, -1, 0]
    
    var dist = [[Int]](repeating: [Int](repeating: Int.max, count: heights[0].count), count: heights.count)
    dist[0][0] = 0
    
    let queue = Queue<Node>()
    queue.enqueue(item: Node(row: 0, col: 0))
    while !queue.isEmpty() {
        let node = queue.dequeue()!
        for i in 0...3 {
            let nx = node.row + rowD[i]
            let ny = node.col + colD[i]
            
            if nx >= 0 && nx < heights.count && ny >= 0 && ny < heights[0].count {
                let dif = heights[node.row][node.col] - heights[nx][ny]
                if max(dist[node.row][node.col], abs(heights[nx][ny] - heights[node.row][node.col])) < dist[nx][ny] {
                    dist[nx][ny] = max(dist[node.row][node.col], abs(heights[nx][ny] - heights[node.row][node.col]))
                    queue.enqueue(item: Node(row: nx, col: ny))
                }
        }
    }
    }
    return dist[heights.count - 1][heights[0].count - 1]
}

