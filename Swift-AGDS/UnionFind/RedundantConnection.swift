//
//  RedundantConnection.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-16.
//

import Foundation

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    var skip = edges.count - 1
    for _ in 0..<edges.count {
        var uf = UF(edges.count)
        for i in 0..<edges.count {
            if i != skip {
                uf.union(edges[i][0] - 1, edges[i][1] - 1)
            }
        }
        if uf.connected(edges[skip][0] - 1, edges[skip][1] - 1) {
            return edges[skip]
        }
        skip -= 1
    }
    return edges[skip]
}
