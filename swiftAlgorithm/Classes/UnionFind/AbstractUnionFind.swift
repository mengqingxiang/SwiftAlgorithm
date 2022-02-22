//
//  AbstractUnionFind.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/22.
//

import Foundation
enum AbstractUnionFindError:Error {
    case IndexOutOfRange
}

public class AbstractUnionFind {
    
    internal var parent:[Int] = [Int]()
    
    public init(capacity:Int) {
        checkAbstract(errorDesc: "not init abstract class")
        for index in 0..<capacity {
            parent.append(index)
        }
    }
    
    internal func rangeCheck(v:Int)throws {
        if v < 0 || v >= parent.count {
            throw AbstractUnionFindError.IndexOutOfRange
        }
    }
    
    public func isSame(v:Int,v1:Int)->Bool {
        checkAbstract(errorDesc: "not call abstract method")
        return false
    }
    
    public func find(v:Int)->Int {
        checkAbstract(errorDesc: "not call abstract method")
        return -1
    }
    
    public func union(v:Int,v1:Int) {
        checkAbstract(errorDesc: "not call abstract method")
    }
    
    private func checkAbstract(errorDesc:String?){
        if type(of: self) == AbstractUnionFind.self { assertionFailure("\(errorDesc ?? "")") }
    }
}
