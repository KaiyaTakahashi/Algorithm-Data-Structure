//
//  Maze.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-08.
//

import Foundation

func maze() {
    let firstLine = readLine()!.split(separator: " ")
    let row = Int(String(firstLine[0]))!
    let col = Int(String(firstLine[1]))!
    
    var map = [[Int]](repeating: [], count: row)
    
    for i in 0..<row - 1{
        let line = readLine()!.map { Int(String($0))! }
        map[i] = line
    }
    
    struct Node {
        let x: Int
        let y: Int
    }
    func maze(x: Int, y: Int) {
        let queue = Queue<Node>()
        queue.enqueue(item: Node(x: x, y: y))
        
        while !queue.isEmpty() {
            // check left, right, above, below
            
            // if its 1
            // if prev count < current count
            //      return
            // increment count
            
        }
    }
}
