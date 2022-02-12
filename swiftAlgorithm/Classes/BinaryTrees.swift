//
//  BinaryTrees.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/12.
//

import Foundation


public protocol BinaryTreeProtocol {
    associatedtype Element
    typealias VisitorClosure = ((_ element:Element)->Bool)
    
    
    func size()-> Int
    func isEmpty()-> Bool
    func depth()-> Int
    func add(element:Element)
    func remove(element:Element)
    func preorderTraverse()
    func inorderTraverse()
    func levelorderTraverse(visitor:VisitorClosure?)
}

public class BinaryTrees<E>:BinaryTreeProtocol where E:Comparable{
    
    public typealias Element = E
    public typealias Comparator = (E, E) -> ComparisonResult
    private var count:Int = 0
    private var root:Node<E>?
    private var compareator:Comparator?

    public init(_ compareator:Comparator?){
        self.compareator = compareator
    }
    
    public convenience init(){
        self.init(nil)
    }

    
    public func size() -> Int {
        return count
    }
    
    public func isEmpty() -> Bool {
        return count == 0
    }
    
    public func add(element: E) {
        guard let rootNode = root else {
            root = Node(element: element,parent: nil)
            count += 1
            return
        }
        
        var node:Node<E>? = rootNode
        let cmp = compare(element, node!.element)
        var parent:Node<E> = node!
        while(node != nil) {
            parent = node!
            switch cmp {
            case .orderedAscending:
                node = node?.left
            case .orderedDescending:
                node = node?.right
            case .orderedSame:
                node?.element = element
                return
            }
        }
        
        let newNode = Node(element: element,parent: parent)
        if cmp == .orderedAscending {
            parent.left = newNode
        }else {
            parent.right = newNode
        }
        count += 1
    }
    
    public func remove(element: E) {

    }
    
    
}

extension BinaryTrees {

    public func preorderTraverse() {
        preorderTraverse(element: root)
    }
    
    private func preorderTraverse(element:Node<E>?) {
        guard let rootNode = root else { return }
        print("")
        preorderTraverse(element: rootNode.left)
        preorderTraverse(element: rootNode.right)
    }
    
    public func inorderTraverse() {
        
    }
    
    public func levelorderTraverse(visitor:VisitorClosure?) {
        guard let visitor = visitor else { return }
        guard let rootNode = root else { return }
        
        var queue:[Node] = [Node<E>]()
        queue.append(rootNode)
        while(!queue.isEmpty){
            let node = queue.removeFirst()
            if visitor(node.element) == true { break }
            
            if let leftNode = node.left {
                queue.append(leftNode)
            }
            
            if let rightNode = node.right {
                queue.append(rightNode)
            }
        }
    }
    
    public func depth() -> Int {
        guard let rootNode = root else { return 0 }
        var levelSize = 1
        var depth = 1
        var queue:[Node] = [Node<E>]()
        queue.append(rootNode)
        
        while(!queue.isEmpty) {
            let node = queue.removeFirst()
            levelSize -= 1
            if let leftNode = node.left{
                queue.append(leftNode)
            }
            
            if let rightNode = node.right{
                queue.append(rightNode)
            }
            
            if levelSize == 0 {
                levelSize = queue.count
                depth += 1
            }
        }
        return depth
    }
    
}


extension BinaryTrees {
    fileprivate func compare(_ element1:E,_ element2:E) -> ComparisonResult{
        if let compareator = compareator {
            return compareator(element1, element2)
        }
        if element1 == element2 { return .orderedSame }
        else if element1 > element2 { return .orderedAscending }
        else { return .orderedDescending }
    }
}

extension BinaryTrees{
    fileprivate class Node<E> {
        var left:Node?
        var right:Node?
        var parent:Node?
        var element:E
        
        init(element:E,parent:Node?) {
            self.element = element
            self.parent = parent
        }
    }
}
