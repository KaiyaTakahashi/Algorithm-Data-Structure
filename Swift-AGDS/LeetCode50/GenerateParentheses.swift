//
//  GenerateParentheses.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-09-21.
//

import Foundation

func generateParenthesis(_ n: Int) -> [String] {
    var arr = [String]()
    
    func dfs(leftp: Int, rightp: Int, parenthese: String) {
        if leftp == 0 && rightp == 0 {
            arr.append(parenthese)
            return
        } else {
            if leftp != 0 && rightp != 0 {
                dfs(leftp: leftp - 1, rightp: rightp + 1, parenthese: parenthese + "(")
                dfs(leftp: leftp, rightp: rightp - 1, parenthese: parenthese + ")")
            } else if leftp == 0 {
                dfs(leftp: leftp, rightp: rightp - 1, parenthese: parenthese + ")")
            } else {
                dfs(leftp: leftp - 1, rightp: rightp + 1, parenthese: parenthese + "(")
            }
        }
    }
    dfs(leftp: n, rightp: 0, parenthese: "")
    return arr
}
