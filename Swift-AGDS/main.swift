//
//  main.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-11.
//

import Foundation



var uf = UF(5)

uf.union(0, 1)
uf.union(2, 3)
uf.union(1, 3)
print(uf.connected(0, 3))
print(uf.root(1))
