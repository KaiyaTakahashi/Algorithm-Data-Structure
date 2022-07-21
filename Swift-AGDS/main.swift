//
//  main.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-11.
//

import Foundation

//print("Hello, World!")
//
//print(power(base:2, exponent: 4))
//
//print(printBinary(0))
//
////print(reverseLines())
//
//print(evaluate("((1+3)+((1+2)*5))"))
//
//printBinaryExhaustive(3)

//printDecimal(2)

//permutation("pork")

//rollDice(2)

//solveQueens(board: &board)
//print(count)

//class Solution {
//    func subsetXORSum(_ nums: [Int]) -> Int {
//        var binaryArray = [String]()
//        var count = 0
//        return subsetXORSumHelper(nums, &binaryArray, &count)
//    }
//
//    var sumOfBinary : Int = 0
//    var binaryBlock = [[String]]()
//    func subsetXORSumHelper(_ nums: [Int], _ binaryArray: inout [String], _ count: inout Int) -> Int {
//        if count == nums.count {
//            // calculate the sum of the binary
//            binaryBlock.append(binaryArray)
//            print(binaryBlock)
//            for binaryNum in binaryArray {
//                var expo: Int = 0
//                var binary = binaryNum
//                sumOfBinary += binaryIntoDecimal(binary: &binary, expo: &expo)
//                expo += 1
//            }
//            binaryArray.removeLast()
//            count -= 1
//            return sumOfBinary
//        } else {
//            // choose num
//            // not choose num
//            // call recursive function
//            for i in 0...1 {
//                var originalBinaryArray = binaryArray
//                if i == 0 {
//                    var targetNum = nums[count]
//                    let binary = intoBinary(num: &targetNum)
//                    binaryArray.append(binary)
//                    count += 1
//                    subsetXORSumHelper(nums, &binaryArray, &count)
//                } else if i == 1 {
//                    count += 1
//                    subsetXORSumHelper(nums , &originalBinaryArray, &count)
//                }
//            }
//        }
//        return sumOfBinary
//    }
//
//    func intoBinary(num num: inout Int) -> String {
//        if num < 2 {
//            if num == 1 {
//                return "1"
//            } else {
//                return "0"
//            }
//        } else {
//            let remainder = num % 2
//            num /= 2
//            return intoBinary(num: &num) + "\(remainder)"
//        }
//    }
//
//    var numArray = [Int]()
//    func calculateBinary(_ binaryArray: [String]) -> Int {
//        if binaryArray.count == 1 {
//            var binaryNum = binaryArray[0]
//            var expo = 0
//            numArray.append(binaryIntoDecimal(binary: &binaryNum, expo: &expo))
//        } else {
//            for binary in binaryArray {
//                var expo = 0
//                var binaryNum = binary
//                numArray.append(binaryIntoDecimal(binary: &binaryNum, expo: &expo))
//            }
//        }
//        var sum: Int = 0
//        for num in numArray {
//            sum += num
//        }
//        return sum
//    }
//
//    func binaryIntoDecimal(binary: inout String, expo: inout Int) -> Int {
//        if binary == "" {
//            return 0
//        } else {
//            let numStr = binary.removeLast()
//            var numInt = Int(String(numStr))!
//            let power = pow(2.0, expo)
//            let a = NSDecimalNumber(decimal: power)
//            numInt *= Int(truncating: a)
//            expo += 1
//            return binaryIntoDecimal(binary: &binary, expo: &expo) + numInt
//        }
//    }
//}
//
var queue = Queue<Int>()
queue.enqueue(item: 1)
queue.enqueue(item: 2)
queue.enqueue(item: 3)


print(queue.dequeue())
print(queue.dequeue())
queue.enqueue(item: 5)

for i in queue {
    print(i)
}
