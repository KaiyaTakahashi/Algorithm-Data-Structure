//
//  QuickSort.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-18.
//

import Foundation


// * Quick Sort (Does not sort in-place)
// Space Complexity: O(n) -> Your implementation should be O(1) (which means you're not supposed to create new arrays)
func quickSortSlow<T: Comparable>(_ arr: [T]) -> [T] {
  if arr.count <= 1 { return arr }
  var elements = arr
  let pivot = elements.removeLast()
  let lessOrEqual = elements.filter { $0 <= pivot }
  let greater = elements.filter { $0 > pivot }
  return quickSortSlow(lessOrEqual) + [pivot] + quickSortSlow(greater)
}

// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
    if start < end {
        let pivotIndex = partition(&arr, start, end)
        
        quickSort(&arr, start, pivotIndex - 1)
        quickSort(&arr, pivotIndex + 1 , end)
    }
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
    var i = start
    var lowerIndex = i - 1
    var pivot = arr[end]
    while i < end {
        if arr[i] < pivot {
            lowerIndex += 1
            let temp = arr[lowerIndex]
            arr[lowerIndex] = arr[i]
            arr[i] = temp
            
        }
        i += 1
    }
    let temp = arr[lowerIndex + 1]
    arr[lowerIndex + 1] = arr[end]
    arr[end] = temp
    
    return lowerIndex + 1
}
