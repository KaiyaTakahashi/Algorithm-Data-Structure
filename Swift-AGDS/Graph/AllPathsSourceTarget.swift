//
//  AllPathsSourceTarget.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-07.
//

import Foundation

func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    let path = [Int]()
    let nodeSum = graph.count - 1
    if nodeSum < 0 {
        return [[]]
    }
    allPathsSourceTarget(next: 0, graph: graph, path: path, nodeSum: nodeSum)
    return possiblePath
}

var possiblePath = [[Int]]()

func allPathsSourceTarget(next: Int, graph: [[Int]], path: [Int], nodeSum: Int) {
    if next == nodeSum {
        possiblePath.append(path.appendToNewArray(newElement: next))
        return
    } else {
        var edgeIndex = 0
        while edgeIndex != graph[next].count {
            allPathsSourceTarget(next: graph[next][edgeIndex], graph: graph, path: path.appendToNewArray(newElement: next), nodeSum: nodeSum)
            edgeIndex += 1
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
