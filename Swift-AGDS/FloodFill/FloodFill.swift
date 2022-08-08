//
//  FloodFill.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-08.
//

import Foundation

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
    
    struct Node {
        let row: Int
        let col: Int
    }
    let rCheck = [1, -1, 0, 0]
    let cCheck = [0, 0, 1, -1]
    
    var newMap: [[Int]] = image.copy()
    func floodFill(_ color: Int, queue: Queue<Node>) {
        while !queue.isEmpty() {
            let node = queue.dequeue()!
            for i in 0...3 {
                let r = rCheck[i] + node.row
                let c = cCheck[i] + node.col
                if r >= 0 && r < image.count && c >= 0 && c < image[0].count {
                    if image[r][c] == 1 && newMap[r][c] != color {
                        newMap[r][c] = color
                        queue.enqueue(item: Node(row: r, col: c))
                    }
                }
            }
        }
    }
    
    var count = 0
    while count != color - 1 {
        let queue = Queue<Node>()
        var i = 0
        while i < image.count {
            if image[i].contains(1) {
                let col = image[i].firstIndex(of: 1)!
                queue.enqueue(item: Node(row: i, col: col))
                newMap[i][col] = color
                i += image.count
            }
            i += 1
        }
        floodFill(color - count, queue: queue)
        count += 1
    }
    return newMap
}

extension Array {
    func copy() -> Array {
        let result = self
        return result
    }
}
//Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2
//Output: [[2,2,2],[2,2,0],[2,0,1]]
