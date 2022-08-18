//
//  UnionFind.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-16.
//

import Foundation

import Foundation

public struct UF {

    private var parent: [Int]

    private var size: [Int]

    private(set) var count: Int
    
    public mutating func getSize(at i: Int) -> Int {
        return size[root(i)]
    }
    
    public mutating func getParent(at i: Int) -> Int {
        return parent[root(i)]
    }
    
    public init(_ n: Int) {
        self.count = n
        self.size = [Int](repeating: 1, count: n)
        self.parent = [Int](repeating: 0, count: n)
        for i in 0..<n {
            self.parent[i] = i
        }
    }

    public mutating func root(_ p: Int) -> Int {
        var i = p
        while parent[i] != i {
            parent[i] = parent[parent[i]]
            i = parent[i]
        }
        return i
    }

    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
        return root(p) == root(q)
    }

    public mutating func union(_ p: Int, _ q: Int) {
        let proot = root(p)
        let qroot = root(q)
        if size[proot] > size[qroot] {
            parent[qroot] = parent[proot]
            size[proot] += size[qroot]
        } else {
            parent[proot] = parent[qroot]
            size[qroot] += size[qroot]
        }
    }
}
