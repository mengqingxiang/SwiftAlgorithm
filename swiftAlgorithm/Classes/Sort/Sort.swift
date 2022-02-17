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

public class insetSort1<E:Comparable>:SortAbstract<E> {
    override internal func sort()->[E]? {
//        guard var array = self.array else { return nil }
        for idx in 1..<array.count {
            let insetValue = array[idx]
            var cur = idx
            while cur > 0,array[cur-1]>insetValue {
                array[cur] = array[cur-1]
                cur -= 1
            }
            array[cur] = insetValue
        }
        return array
    }
    
}

public class insetSort<E:Comparable>:SortAbstract<E> {
    override internal func sort()->[E]? {
//        guard var array = self.array else { return nil }
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



public class QuickSort<E:Comparable>:SortAbstract<E> {
    override internal func sort()->[E]? {
        sort(begin: 0, end: array.count)
        return array
    }
    
    private func sort(begin:Int,end:Int) {
        if end - begin < 2 { return }
        let middleIndex = poivetIndex(begin: begin, end: end)
        sort(begin: begin, end: middleIndex)
        sort(begin: middleIndex+1, end: end)
    }
    
    private func poivetIndex(begin:Int,end:Int)->Int {
        var statrIndex:Int = begin, endIndex:Int = end-1
        let poiteValue = array[begin]
        while statrIndex < endIndex {
            while statrIndex < endIndex {
                if cmp(poiteValue, ele1: array[endIndex]) == .orderedAscending {
                    array[statrIndex] = array[endIndex]
                    statrIndex += 1
                    break
                }
                endIndex -= 1
            }
            
            while statrIndex < endIndex {
                if cmp(poiteValue, ele1: array[statrIndex]) == .orderedDescending {
                    array[endIndex] = array[statrIndex]
                    endIndex -= 1
                    break
                }
                statrIndex += 1
            }
        }
        array[statrIndex] = poiteValue
        return statrIndex
    }
}


public class mergeSort<E:Comparable>:SortAbstract<E> {
    override internal func sort()->[E]? {
        sort(begin: 0, end: array.count)
        return array
    }
    
    private func sort(begin:Int,end:Int) {
        if end - begin < 2 { return }
        let middle:Int = (end+begin)/2
        sort(begin: begin, end: middle)
        sort(begin: middle, end: end)
        merge(begin: begin, minddle: middle, end: end)
    }
    
    private func merge(begin:Int,minddle:Int, end:Int) {
        var tempArray = [E]()
        for num in begin...minddle {
            tempArray.append(array[num])
        }
        
        var leftIndex = 0,rightIndex = minddle
        var writeIndex = begin
        let length = minddle - begin
        
        while leftIndex < length {
            if rightIndex<end,cmp(tempArray[leftIndex], ele1: array[rightIndex]) == .orderedAscending {
                array[writeIndex] = array[rightIndex]
                rightIndex += 1
            }else {
                array[writeIndex] = tempArray[leftIndex]
                leftIndex += 1
            }
            writeIndex += 1
        }
    }
}
