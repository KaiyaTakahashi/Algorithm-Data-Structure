//
//  UniquePaths.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-09-21.
//

import Foundation

//func uniquePaths(_ m: Int, _ n: Int) -> Int {
//    let cDir = [1, 0]
//    let rDir = [0, 1]
//    var count = 0
//    func dfs(nextC: Int, nextR: Int) {
//        if nextC == n - 1 && nextR == m - 1 {
//            count += 1
//            return
//        } else {
//            for i in 0...1 {
//                let c = nextC + cDir[i]
//                let r = nextR + rDir[i]
//                if c < n && r < m {
//                    dfs(nextC: c, nextR: r)
//                }
//            }
//        }
//    }
//    dfs(nextC: 0, nextR: 0)
//    return count
//}

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var memoise = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    for i in 0..<m {
        memoise[i][0] = 1
    }
    for i in 0..<n {
        memoise[0][i] = 1
    }
    for i in 1..<m {
        for j in 1..<n {
            memoise[i][j] = memoise[i][j - 1] + memoise[i - 1][j]
        }
    }
    return memoise[m - 1][n - 1]
}
