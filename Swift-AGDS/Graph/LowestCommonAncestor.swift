//
//  LowestCommonAncestor.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-04.
//

import Foundation

func lca() {
    let nodeSume = Int(String(readLine()!))!
    
    var adjList = [[Int]](repeating: [], count: nodeSume)
    
    for _ in 1..<nodeSume {
        let edge = readLine()!.split(separator: " ")
        let l = Int(String(edge[0]))!
        let r = Int(String(edge[1]))!
        adjList[l - 1].append(r)
        adjList[r - 1].append(l)
    }
    
    
    let pairSum = Int(String(readLine()!))!
    var pairArr = [[Int]](repeating: [], count: pairSum)
    
    for i in 0..<pairSum {
        let pair = readLine()!.split(separator: " ")
        let l = Int(String(pair[0]))!
        let r = Int(String(pair[1]))!
        pairArr[i].append(l)
        pairArr[i].append(r)
    }
    
    
    var lcaArr = [Int]()
    for i in 0..<pairArr.count {
        let high: Int
        let low: Int
        if pairArr[i][0] > pairArr[i][1] {
            low = pairArr[i][0]
            high = pairArr[i][1]
        } else {
            low = pairArr[i][1]
            high = pairArr[i][0]
        }
        var possibleAnce = [Int]()
        lcaArr.append(lca(lNext: low, hNext: high, adjList: adjList, possibAnces: &possibleAnce))
    }
    
    for i in lcaArr {
        print(i)
    }
}

func lca(lNext: Int, hNext: Int, adjList: [[Int]], possibAnces: inout [Int]) -> Int {
    if possibAnces.contains(lNext)  {
        return lNext
    } else {
        if possibAnces.isEmpty {
            possibAnces.append(hNext)
        }
        if hNext == 1 && lNext != 1 {
            for i in 0..<adjList[lNext - 1].count {
                if adjList[lNext - 1][i] < lNext {
                    return lca(lNext: adjList[lNext - 1][i], hNext: 1, adjList: adjList, possibAnces: &possibAnces)
                }
            }
        } else {
            for i in 0..<adjList[hNext - 1].count {
                if adjList[hNext - 1][i] < hNext {
                    for j in 0..<adjList[lNext - 1].count {
                        if adjList[lNext - 1][j] < lNext {
                            if possibAnces[possibAnces.count - 1] != 1 {
                                possibAnces.append(adjList[hNext - 1][i])
                            }
                            return lca(lNext: adjList[lNext - 1][j], hNext: adjList[hNext - 1][i], adjList: adjList, possibAnces: &possibAnces)
                        }
                    }
                }
            }
        }
    }
    return -1
}




func lca2(x: Int, y: Int, adjList: [[Int]]) -> Int {
    var lcaArr = [Int]()
    let high: Int
    let low: Int
    high = x > y ? y: x
    low = x > y ? x: y
    var possibleAnce = [Int]()
    return (lca2(lNext: low, hNext: high, adjList: adjList, possibAnces: &possibleAnce))
}

func lca2(lNext: Int, hNext: Int, adjList: [[Int]], possibAnces: inout [Int]) -> Int {
    if possibAnces.contains(lNext)  {
        return lNext
    } else {
        if possibAnces.isEmpty {
            possibAnces.append(hNext)
        }
        if hNext == 0 && lNext != 0 {
            for i in 0..<adjList[lNext].count {
                if adjList[lNext][i] < lNext {
                    return lca2(lNext: adjList[lNext][i], hNext: 0, adjList: adjList, possibAnces: &possibAnces)
                }
            }
        } else {
            for i in 0..<adjList[hNext].count {
                if adjList[hNext][i] < hNext {
                    for j in 0..<adjList[lNext].count {
                        if adjList[lNext][j] < lNext {
                            if possibAnces[possibAnces.count - 1] != 0 {
                                possibAnces.append(adjList[hNext][i])
                            }
                            return lca2(lNext: adjList[lNext][j], hNext: adjList[hNext][i], adjList: adjList, possibAnces: &possibAnces)
                        }
                    }
                }
            }
        }
    }
    return -1
}
