//
//  Diameter.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-31.
//

import Foundation

func diameter() {
    // create Tree
    let nodeSum = Int(String(readLine()!))!
    // create adjacencey list
    var adjacencyList = [[Int]](repeating: [], count: nodeSum)
    for i in 0..<nodeSum {
        let edgeInfo = readLine()!.split(separator: " ")
        var index = 0
        while edgeInfo[index] != "-1" {
            adjacencyList[i].append(Int(String(edgeInfo[index]))!)
            index += 1
        }
    }

    let tree = [Int]()
    for i in 1...nodeSum {
        diameter(tree: tree.appendToNewArray(newElement: i), adjList: adjacencyList, next: i, sum: 0)
    }
    print(longestTree)
    print(distance)
}

var longestTree = [Int]()
var distance = 0
func diameter(tree: [Int], adjList: [[Int]], next: Int, sum: Int) {
    if adjList[next - 1].count == 3 && tree.count != 1 {
        if sum > distance {
            distance = sum
            longestTree = tree
        }
        return
    } else {
        var edgeIndex = 1
        while edgeIndex != adjList[next - 1].count {
            if tree.count < 2 || tree[tree.count - 2] != adjList[next - 1][edgeIndex] {
                diameter(tree: tree.appendToNewArray(newElement: adjList[next - 1][edgeIndex]), adjList: adjList, next: adjList[next - 1][edgeIndex], sum: sum + adjList[next - 1][edgeIndex + 1])
            }
            edgeIndex += 2
        }
    }
}

extension Array {
    func appendToNewArray(newElement: Element) -> Array {
        var result = self
        result.append(newElement)
        return result
    }
}
