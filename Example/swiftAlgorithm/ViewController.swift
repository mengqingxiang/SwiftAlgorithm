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
        
        
        let graph = ListGraph<String,Int>()
        graph.addEdge(from: "V0", to: "V1", weight: 1)
        graph.addEdge(from: "V1", to: "V2", weight: 2)
        graph.addEdge(from: "V2", to: "V3", weight: 3)
        graph.addEdge(from: "V3", to: "V4", weight: 4)
        graph.addEdge(from: "V4", to: "V5", weight: 5)
        graph.addEdge(from: "V3", to: "V5", weight: 6)
        print(graph)
    }

}
