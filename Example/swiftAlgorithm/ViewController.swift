//
//  ViewController.swift
//  swiftAlgorithm
//
//  Created by mengqingxiang on 02/12/2022.
//  Copyright (c) 2022 mengqingxiang. All rights reserved.
//

import UIKit
import swiftAlgorithm
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let values:[Int] = [1,2,3,4,5]
//        let binaryTree:BinaryTrees<Int> = BinaryTrees<Int> { (ele1, ele2) in
//            if ele1 == ele2 { return .orderedSame}
//            else if ele1 > ele2 {return .orderedAscending }
//            else { return .orderedDescending }
//        }
//        for num in values {
//            binaryTree.add(element: num)
//        }
//
//        print("=============================")
//        binaryTree.levelorderTraverse { element in
//            print(element)
//            return false
//        }
        
//        var randomValues:[Int] = [Int]()
//        for _ in 0..<10 {
//            let randomNum = Int(arc4random() % 1000)
//            randomValues.append(randomNum)
//        }
//
//        let sorts = [QuickSort<Int>(),BubbleSort<Int>(),SelectSort<Int>(),insetSort<Int>(),mergeSort<Int>()]
//        for task in sorts {
//            let arr = task.sort(randomValues)
//            if randomValues.count <= 100 {
//                print(arr!)
//            }
//            print(task)
//        }
        
        
//        testGraph()
        testUnionFind(quickFind: QuickFind(capacity: 100))
        testUnionFind(quickFind: QuickUnion(capacity: 100))
        testUnionFind(quickFind: QuickUnionS(capacity: 100))
        testUnionFind(quickFind: QuickUnionR(capacity: 100))
        testUnionFind(quickFind: QuickUnionR_PC(capacity: 100))
        testUnionFind(quickFind: QuickUnionR_PS(capacity: 100))
        
//        testTimes(quickFind: QuickFind(capacity: count))
//        testTimes(quickFind: QuickUnion(capacity: count))
        testTimes(quickFind: QuickUnionS(capacity: count))
        testTimes(quickFind: QuickUnionR(capacity: count))
        testTimes(quickFind: QuickUnionR_PC(capacity: count))
        testTimes(quickFind: QuickUnionR_PS(capacity: count))
        
    }
    let count = 10_0000
    
    func testTimes(quickFind:AbstractUnionFind) {
       
        Times.doTask(taskName: "\(quickFind.self))") {
            for _ in 0..<self.count {
                _ = quickFind.union(v: Int.random(in: 0..<self.count), v1: Int.random(in: 0..<self.count))
            }
            
            for _ in 0..<10_0000 {
                _ = quickFind.isSame(v: Int.random(in: 0..<self.count), v1: Int.random(in: 0..<self.count))
            }
        }
    }
    
    func testUnionFind(quickFind:AbstractUnionFind) {
        quickFind.union(v: 0, v1: 1)
        quickFind.union(v: 0, v1: 3)
        quickFind.union(v: 0, v1: 4)
        quickFind.union(v: 2, v1: 3)
        quickFind.union(v: 2, v1: 5)
        
        quickFind.union(v: 6, v1: 7)
        
        quickFind.union(v: 8, v1: 10)
        quickFind.union(v: 9, v1: 10)
        quickFind.union(v: 9, v1: 11)
        
        Asserts.test(!quickFind.isSame(v: 0, v1: 6))
        Asserts.test(quickFind.isSame(v: 0, v1: 5))
        quickFind.union(v: 4, v1: 6)
        
        Asserts.test(quickFind.isSame(v: 4, v1: 6))
        Asserts.test(quickFind.isSame(v: 2, v1: 7))
        Asserts.test(!quickFind.isSame(v: 8, v1: 7))
    }

    func testGraph() {
        let graph = ListGraph<String,Int>()
        graph.addEdge(from: "V0", to: "V4", weight: 6)
        graph.addEdge(from: "V1", to: "V0", weight: 9)
        graph.addEdge(from: "V1", to: "V2", weight: 3)
        graph.addEdge(from: "V2", to: "V3", weight: 5)
        graph.addEdge(from: "V3", to: "V4", weight: 1)
        graph.addEdge(from: "V2", to: "V0", weight: 2)
        print(graph)
        
        graph.removeVertex(element: "V0")
        print(graph)
        
        graph.dfs2(element: "V1") { element in
            print(element)
            if element == "V0" { return true }
            return false
        }
        print("\n----------------------")
        graph.bfs(element: "V1") { element in
            print(element)
            if element == "V2" { return true }
            return false
        }
    }

}
