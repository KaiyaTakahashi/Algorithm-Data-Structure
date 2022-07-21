//
//  Stack.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-20.
//

import Foundation

/// The Stack class represents a last-in-first-out (LIFO) stack of generic items.
/// It supports the usual *push* and *pop* operations, along with methods for peeking at the top item, testing if the stack is empty, and iterating through the items in LIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Stack<E>: Sequence {
    
    private var first: Node<E>? = nil
    private var head: Node<E>? = nil
    private var previous: Node<E>? = nil
    
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
    
    public func push(item: E) {
        if first == nil {
            first = Node(item: item, next: nil)
            head = first
        } else {
            let newNode = Node(item: item, next: nil)
            previous = head
            head?.next = newNode
            head = newNode
        }
    }
    
    public func pop() -> E? {
        let oldHead = head
        head = previous
        return oldHead?.item
    }
    
    public func peek() -> E? {
        return head?.item
    }
    
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    public struct StackIterator<E>: IteratorProtocol{
        private var current: Node<E>?
        
        fileprivate init(first: Node<E>?) {
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
    
    public func makeIterator() -> StackIterator<E> {
        return StackIterator(first: first)
    }
    
}
