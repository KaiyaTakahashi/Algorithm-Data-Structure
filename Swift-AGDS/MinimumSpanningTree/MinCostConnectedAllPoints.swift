//
//  MinCostConnectedAllPoints.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-20.
//

import Foundation

func minCostConnectPoints(_ points: [[Int]]) -> Int {
    var edges = [[Int]]()
    for i in 0..<points.count {
        for j in i + 1..<points.count {
            var edge = [Int]()
            edge.append(i)
            edge.append(j)
            let biggerX = points[i][0] > points[j][0] ? points[i][0]: points[j][0]
            let smallerX = points[i][0] > points[j][0] ? points[j][0]: points[i][0]
            let biggerY = points[i][1] > points[j][1] ? points[i][1]: points[j][1]
            let smallerY = points[i][1] > points[j][1] ? points[j][1]: points[i][1]
            edge.append(biggerX - smallerX + biggerY - smallerY)
            edges.append(edge)
        }
    }
    
    edges = edges.sorted { $0[2] < $1[2] }
    var uf = UF(points.count)
    var count = 0
    var checkIndex = 0
    var ans = 0
    while count != points.count - 1 {
        if !uf.connected(edges[checkIndex][0], edges[checkIndex][1]) {
            uf.union(edges[checkIndex][0], edges[checkIndex][1])
            ans += edges[checkIndex][2]
            count += 1
        }
        checkIndex += 1
    }
    return ans
}


func minPartitions(_ n: String) -> Int {
    var biggest = 0
    for i in 0..<n.count {
        let numInt = Int(n[i])!
        if biggest < numInt {
            biggest = numInt
        }
    }
    return biggest
}

