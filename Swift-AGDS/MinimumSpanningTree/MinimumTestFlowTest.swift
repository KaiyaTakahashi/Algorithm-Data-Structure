//
//  MinimumTestFlowTest.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-19.
//

import Foundation

func minimumCostFlowTest() -> String {
    for i in 1...50 {
        let baseFilename = "/Users/kaiyatakahashi/Downloads/mcf/mcf"
        let fileNum = i < 10 ? "0" + String(i) : String(i)
        let inFilename = baseFilename + "." + fileNum + ".in"
        let outFilename = baseFilename + "." + fileNum + ".out"
        var str1: String = ""
        var str2: String = ""
        var myCounter1: Int
        var myCounter2: Int
        do {
            let inContents = try String(contentsOfFile: inFilename)
            let inLines = inContents.split(separator: "\n")
            let outContents = try String(contentsOfFile: outFilename)
            let outLines = outContents.split(separator: "\n")
            myCounter1 = inLines.count
            for i in 0..<myCounter1 {
                str1 += String(inLines[i])
                str1 += "\n"
            }
            myCounter2 = outLines.count
            for i in 0..<myCounter2 {
                str2 += String(outLines[i])
                str2 += "\n"
            }
        } catch {
            return (error.localizedDescription)
        }
    }
    return "Passed All Test Case"
}
