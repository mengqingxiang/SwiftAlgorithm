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
        let values:[Int] = [1,2,3,4,5]
        let binaryTree:BinaryTrees<Int> = BinaryTrees<Int> { (ele1, ele2) in
            if ele1 == ele2 { return .orderedSame}
            else if ele1 > ele2 {return .orderedAscending }
            else { return .orderedDescending }
        }
        for num in values {
            binaryTree.add(element: num)
        }
        
        print("=============================")
        binaryTree.levelorderTraverse { element in
            print(element)
            return false
        }
    }

}

