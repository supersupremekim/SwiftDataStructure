//
//  BinarySearchTree.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/20.
//

import Foundation

enum BinaryTree<T: Comparable> {
    case empty
    
    //메모리에 값 타입 인스턴스 올릴 때, 정확히 얼마가 될 지 알아야하는데, 재귀가 생기면 크기가 얼마나 될 지 알 수 없어서 오류가 생김, indirect 써주면 reference가 올라가서 크기를 알 수 있어서 오류 해결
    indirect case node(BinaryTree, T, BinaryTree)
    
    mutating func naiveInsert(newValue: T){
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        
        if newValue < value {
            left.naiveInsert(newValue: newValue)
        } else {
            right.naiveInsert(newValue: newValue)
        }
        
    }
}


public class BinarySearchTree<T> {
    
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T){
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return left != nil || right != nil
    }
    
    public var hasBothChildren: Bool {
        return left != nil && right != nil
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
}
