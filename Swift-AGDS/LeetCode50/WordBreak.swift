//
//  WordBreak.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-11-01.
//

import Foundation

//func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//    var set = Set<String>()
//    for i in 0..<wordDict.count {
//        if wordDict[i].count == 1 {
//            set.insert(wordDict[i])
//        }
//    }
//    var newDic = [String]()
//    for i in 0..<wordDict.count {
//        var isDuplicate = true
//        for j in 0..<wordDict[i].count {
//            if !set.contains(wordDict[i][j]) {
//                isDuplicate = false
//            }
//        }
//        if !isDuplicate {
//            newDic.append(wordDict[i])
//        }
//    }
//    while !set.isEmpty {
//        newDic.append(set.popFirst()!)
//    }
//    var ans = false
//    func dfs(remainingStr: String) {
//        print(remainingStr)
//        if remainingStr.count == 0 {
//            ans = true
//            return
//        } else {
//            for i in 0..<newDic.count {
//                if remainingStr.prefix(newDic[i].count) == newDic[i] {
//                    let suffixNum = remainingStr.count - newDic[i].count
//                    dfs(remainingStr: String(remainingStr.suffix(suffixNum)))
//                }
//            }
//        }
//    }
//
//    dfs(remainingStr: s)
//    return ans
//}

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var dp = [Bool](repeating: false, count: s.count)
    var start = 0
    var end = -(s.count - 2)
    while start != s.count {
        let eIndex = s.index(s.startIndex, offsetBy: end)
        let sIndex = s.index(s.endIndex, offsetBy: start)
        let range = sIndex..<eIndex
        if wordDict.contains(String(s[range])) {
            dp[s.count + end - 2] = true
        } else {

        }
    }
    return true
}
