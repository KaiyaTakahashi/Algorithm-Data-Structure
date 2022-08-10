//
//  Bridges.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-09.
//

import Foundation

private var shortest = -1

func bridge() {
    let n = Int(String(readLine()!))!
    var islandMap = [[Int]](repeating: [], count: n)
    
    for i in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        islandMap[i] = row
    }
    
    let rDir = [0, 0, 1, -1]
    let cDir = [1, -1, 0, 0]
    
    var newMap = islandMap.copy()
    func differenciateIsland() {
        var count = -1
        for i in 0..<newMap.count {
            if newMap[i].contains(1) {
                let start = newMap[i].firstIndex(of: 1)!
                let queue = Queue<Block>()
                queue.enqueue(item: Block(row: i, col: start, count: count, islandNum: -1))
                while !queue.isEmpty() {
                    let block = queue.dequeue()!
                    for i in 0...3 {
                        let r = rDir[i] + block.row
                        let c = cDir[i] + block.col
                        if r >= 0 && r < n && c >= 0 && c < n && newMap[r][c] == 1 {
                            newMap[r][c] = block.count
                            queue.enqueue(item: Block(row: r, col: c, count: block.count, islandNum: -1))
                        }
                    }
                }
                count -= 1
            }
        }
    }
    
    differenciateIsland()
    
    struct Block {
        let row: Int
        let col: Int
        let count: Int
        let islandNum: Int
    }

    var blocksFacingSea = [Block]()
    for i in 0..<n {
        for j in 0..<n {
            if newMap[i][j] != 0 {
                var index = 0
                while index != 4 {
                    let r = rDir[index] + i
                    let c = cDir[index] + j
                    if r >= 0 && r < n && c >= 0 && c < n && newMap[r][c] == 0 {
                        blocksFacingSea.append(Block(row: i, col: j, count: 1, islandNum: newMap[i][j]))
                        index = 3
                    }
                    index += 1
                }
            }
        }
    }
    blocksFacingSea = blocksFacingSea.sorted { $0.count > $1.count }

    let queue = Queue<Block>()
    var shortestBridge = 2 * n - 3
    func bfs() {
        var tempMap = newMap.copy()
        while !blocksFacingSea.isEmpty {
            let startBlock = blocksFacingSea.removeFirst()
            queue.enqueue(item: startBlock)
            while !queue.isEmpty() {
                let block = queue.dequeue()!
                var i = 0
                while i != 4 {
                    let r = block.row + rDir[i]
                    let c = block.col + cDir[i]
                    if r >= 0 && r < n && c >= 0 && c < n {
                        if tempMap[r][c] == 0 {
                            queue.enqueue(item: Block(row: r, col: c, count: block.count + 1, islandNum: block.islandNum))
                            tempMap[r][c] = block.count
                        } else if tempMap[r][c] != block.islandNum && tempMap[r][c] < 0 {
                            if shortestBridge > block.count - 1 {
                                shortestBridge = block.count - 1
                            }
                            tempMap = newMap.copy()
                            i = 3
                            while !queue.isEmpty() {
                                let _ = queue.dequeue()
                            }
                        }
                    }
                    i += 1
                }
            }
        }
    }
    bfs()
    print(shortestBridge)
}
