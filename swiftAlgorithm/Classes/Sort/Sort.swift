//
//  Sort.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/15.
//


public class BubbleSort<E:Comparable>:SortAbstract<E> {
    override internal func sort()->[E]? {
        for var idx in 0..<array.count {
            var endIndex = array.count-1
            for jdx in 1..<array.count-idx {
                if cmp(array[jdx], ele1: array[jdx-1]) == .orderedDescending {
                    swapValue(leftIndex: jdx, rightIndex: jdx-1)
                    endIndex = jdx
                }
            }
            idx = endIndex
        }
        return nil
    }
}

public class SelectSort<E:Comparable>:SortAbstract<E> {
    override internal func sort()->[E]? {
        for idx in 0..<array.count {
            var maxIndex = 0
            for jdx in 1..<array.count-idx {
                if cmp(array[maxIndex], ele1: array[jdx]) == .orderedDescending {
                    maxIndex = jdx
                }
            }
            swapValue(leftIndex: maxIndex, rightIndex: array.count-1-idx)
        }
        return nil
    }
}

public class insetSort<E:Comparable>:SortAbstract<E> {
    override internal func sort()->[E]? {
        guard var array = self.array else { return nil }
        for idx in 1..<array.count {
            let insetValue = array[idx]
            var cur = idx
            let insetIndex = searchInsetIndex(value: insetValue, startIndex: 0, endIndex: idx)
            while cur > insetIndex {
                array[cur] = array[cur-1]
                cur -= 1
            }
            array[insetIndex] = insetValue
        }
        return array
    }
    
    private func searchInsetIndex(value:E,startIndex:Int,endIndex:Int)->Int {
        var beginIndex = startIndex,endIndex = endIndex
        var mindIndex = array.count
        
        while beginIndex < endIndex {
            mindIndex = (beginIndex + endIndex)/2
            if cmp(value, ele1: array[mindIndex]) == .orderedAscending {
                beginIndex = mindIndex + 1
            }else {
                endIndex = mindIndex
            }
        }
        return beginIndex
    }
    
    public func binarySearch(array:[E],value:E)->Int {
        var beginIndex = 0,endIndex = array.count-1
        var mindIndex = -1
        
        while beginIndex < endIndex {
            mindIndex = (beginIndex + endIndex)/2
            if cmp(array[mindIndex], ele1: value) == .orderedAscending {
                beginIndex = mindIndex + 1
            }else if cmp(array[mindIndex], ele1: value) == .orderedDescending {
                endIndex = mindIndex
            }else {
                return mindIndex
            }
        }
        return -1
    }
    
}



public func bubbleSort(_ array:[Int]?)->[Int]? {
    guard let arr = array else { return nil }
    var array = arr
    for var idx in 0..<array.count {
        var endIndex = array.count
        for jdx in 1..<array.count-idx {
            if array[jdx] < array[jdx-1] {
                let temp = array[jdx]
                array[jdx] = array[jdx-1]
                array[jdx-1] = temp
                endIndex = jdx
            }
        }
        idx = endIndex
    }
    return array
}

public func selectSort(_ array:[Int]?)->[Int]? {
    guard let arr = array else { return nil }
    var array = arr
    for idx in 0..<array.count {
        var max = 0
        for jdx in 1..<array.count-idx {
            if array[max] < array[jdx] {
                max = jdx
            }
        }
        
        let lastIndex = array.count-idx-1
        let temp = array[lastIndex]
        array[lastIndex] = array[max]
        array[max] = temp
    }
    return array
}
