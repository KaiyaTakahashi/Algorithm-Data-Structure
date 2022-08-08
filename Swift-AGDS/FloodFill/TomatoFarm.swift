//
//  TomatoFarm.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-08.
//

import Foundation

func tomatoFarm() -> Int {
    let firstLine = readLine()!.split(separator: " ")
    let w = Int(String(firstLine[0]))!
    let h = Int(String(firstLine[1]))!
    
    struct Box {
        let row: Int
        let col: Int
        let day: Int
    }
    var ripeTomatos = [Box]()
    let queue = Queue<Box>()

    var grid = [[Int]](repeating: [], count: h)
    for i in 0..<h {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        grid[i] = row
    }

    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            if grid[i][j] == 1 {
                ripeTomatos.append(Box(row: i, col: j, day: 0))
            }
        }
    }

    let rCheck = [0, 0, 1, -1]
    let cCheck = [1, -1, 0, 0]
    var total = 0
    func bfs() {
        while !queue.isEmpty() {
            let box = queue.dequeue()!
            if queue.isEmpty() {
                total = box.day
            }
            for i in 0...3 {
                let r = rCheck[i] + box.row
                let c = cCheck[i] + box.col
                if r >= 0 && r < h && c >= 0 && c < w {
                    if grid[r][c] == 0 {
                        grid[r][c] = box.day + 1
                        queue.enqueue(item: Box(row: r, col: c, day: box.day + 1))
                    }
                }
            }
        }
    }

    for ripeTomato in ripeTomatos {
        queue.enqueue(item: ripeTomato)
    }
    bfs()
    for i in 0..<grid.count - 1 {
        for j in 0..<grid[0].count - 1 {
            if grid[i][j] == 0 {
                return -1
            }
        }
    }
    return total
}
