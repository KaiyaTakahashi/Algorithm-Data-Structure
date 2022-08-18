//
//  TheNumberOfProvinces.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-17.
//

import Foundation

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var uf = UF(isConnected.count)
        var mutableIsConnected = isConnected
        
        for i in 0..<isConnected.count {
            for j in 0..<isConnected[i].count {
                if i != j {
                    if mutableIsConnected[i][j] == 1 {
                        uf.union(i, j)
                        mutableIsConnected[j][i] = 0
                    }
                }
            }
        }
        var set = Set<Int>()

        for i in 0..<isConnected.count {
            set.insert(uf.getParent(at: i))
        }
        return set.count
    }
}
