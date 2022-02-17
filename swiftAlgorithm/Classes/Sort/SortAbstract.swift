//
//  SortAbstract.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/16.
//

import Foundation



public class SortAbstract<E> where E:Comparable {
    internal var array:[E]!
    private  var swapCount:Int = 0
    private  var cmpCount:Int = 0
    private  var time:TimeInterval = 0
    
    public init() {}
    
    public func sort(_ arr:[E]?) ->[E]?{
        if type(of: self) == SortAbstract.self { assertionFailure("You cannot use abstract classes") }
        guard let arr = arr else { return nil }
        array = arr
        
        let beginTime = Date().timeIntervalSince1970
        var a = sort()
        let endTime = Date().timeIntervalSince1970
        time = endTime - beginTime
        return array
    }
    
    internal func sort()->[E]? {
        if type(of: self) == SortAbstract.self { assertionFailure("You cannot use abstract method") }
        return nil
    }
}

extension SortAbstract {
    public  func cmp(_ ele:E,ele1:E) -> ComparisonResult {
        cmpCount += 1
        if ele < ele1 { return .orderedDescending }
        else if ele > ele1 { return .orderedAscending }
        else { return .orderedSame }
    }
    
    public func swapValue(leftIndex:Int, rightIndex:Int) {
        swapCount += 1
        let temp = array[leftIndex]
        array[leftIndex] = array[rightIndex]
        array[rightIndex] = temp
    }
}


extension SortAbstract:CustomStringConvertible {

    public var description: String {
        return "\(type(of: self)) swapCount:\(swapCount)---cmpCount:\(cmpCount)---time:\(time)\n----------------------------"
    }
}
