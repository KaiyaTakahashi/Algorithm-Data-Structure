//
//  MinimumTestFlowTest.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-19.
//

import Foundation

func minimumCostFlowTest() {
    for i in 1...50 {
        print("file\(i)")
        let baseFilename = "/Users/kaiyatakahashi/Downloads/mcf/mcf"
        let fileNum = i < 10 ? "0" + String(i) : String(i)
        let inFilename = baseFilename + "." + fileNum + ".in"
        let outFilename = baseFilename + "." + fileNum + ".out"
        var str1 = [[Int]]()
        var str2 = [[Int]]()
        var myCounter1: Int
        var myCounter2: Int
        do {
            let inContents = try String(contentsOfFile: inFilename)
            let inLines = inContents.split(separator: "\n")
            let outContents = try String(contentsOfFile: outFilename)
            let outLines = outContents.split(separator: "\n")
            myCounter1 = inLines.count
            for i in 0..<myCounter1 {
                let line = inLines[i].split(separator: " ").map { Int(String($0))! }
                str1.append(line)
            }
            myCounter2 = outLines.count
            for i in 0..<myCounter2 {
                let line = outLines[i].split(separator: " ").map { Int(String($0))! }
                str2.append(line)
            }
            let ans = minimumCostFlow(input: str1)

            if ans == str2[0][0] {
                print("Passed Test Case\(i)")
            } else {
                print("Faild, input:\(inLines), expected: \(outLines)")
            }
        } catch {
            (error.localizedDescription)
        }
    }
}
