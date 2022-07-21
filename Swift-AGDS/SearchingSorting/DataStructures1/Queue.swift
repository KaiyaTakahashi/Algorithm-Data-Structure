//
//  Queue.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-20.
//

import Foundation

public final class Queue<E>: Sequence {
    
    private var first: Node<E>? = nil
    
    private(set) var count: Int = 0
    
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>?) {
            self.item = item
            self.next = next
        }
    }
    
    init() { }
    
    public func enqueue(item: E) {
        let newNode = Node<E>(item: item, next: nil)
        if first == nil {
            first = newNode
        } else {
            var iterateNode = first
            while iterateNode?.next != nil {
                iterateNode = iterateNode?.next
            }
            iterateNode?.next = newNode
        }
    }
    
    public func dequeue() -> E? {
        let firstNode = first
        first = first?.next
        return firstNode?.item
    }
    
    public func peek() -> E? {
        return first?.item
    }
    
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    public struct QueueIterator<E>: IteratorProtocol {
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
    }
    
    public func makeIterator() -> QueueIterator<E> {
        return QueueIterator(first)
    }
}
