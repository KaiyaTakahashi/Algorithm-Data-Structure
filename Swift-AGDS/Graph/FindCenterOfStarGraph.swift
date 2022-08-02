//
//  FindCenterOfStarGraph.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-02.
//

import Foundation

func findCenter(_ edges: [[Int]]) -> Int {
    var commonV = -1
    if edges[0].contains(edges[1][1]) {
        commonV = edges[1][1]
    } else {
        commonV = edges[1][0]
    }
    return commonV
}
