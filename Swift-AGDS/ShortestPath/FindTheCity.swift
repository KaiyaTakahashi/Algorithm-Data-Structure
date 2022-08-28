//
//  FindTheCity.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-27.
//

import Foundation

func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
    var shortestD = [[Int]](repeating: [Int](repeating: 10001, count: n), count: n)
    for edge in edges {
        shortestD[edge[0]][edge[1]] = edge[2]
        shortestD[edge[1]][edge[0]] = edge[2]
    }

    for i in 0..<n {
        shortestD[i][i] = 0
    }

    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                if shortestD[j][k] > shortestD[j][i] + shortestD[i][k] {
                    shortestD[j][k] = shortestD[j][i] + shortestD[i][k]
                }
            }
        }
    }
    
    var ans = (Int.max, -1)
    for i in 0..<shortestD.count {
        var count = 0
        for j in 0..<shortestD.count  {
            if shortestD[i][j] <= distanceThreshold {
                count += 1
            }
        }
        if count <= ans.0 {
            ans.0 = count
            ans.1 = i
        }
    }
    return ans.1
}
