//
//  myParent.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-29.
//

import Foundation

func myParent() {
    let firstLine = readLine()!
    let nodeSum = Int(String(firstLine))!
    var arr = [Int](repeating: 0, count: nodeSum - 1)
    var adjList = [[Int]](repeating: [], count: nodeSum)

    let count = nodeSum - 1
    for _ in 1...count{
        let line = readLine()!.split(separator: " ")
        let l = Int(String(line[0]))!
        let r = Int(String(line[1]))!
        adjList[l - 1].append(r)
        adjList[r - 1].append(l)
    }

    myParent(next: 1, prev: 0, adjList: adjList, arr: &arr)

    for i in arr {
        print(i)
    }
}

func myParent(next: Int, prev: Int, adjList: [[Int]], arr: inout [Int]) {
    if adjList[next - 1].count == 1 && next != 1 {
        arr[next - 2] = prev
        return
    } else {
        for i in 0..<adjList[next - 1].count {
            if adjList[next - 1][i] != prev {
                arr[adjList[next - 1][i] - 2] = next
                myParent(next: adjList[next - 1][i], prev: next, adjList: adjList, arr: &arr)
            }
        }
    }
}
