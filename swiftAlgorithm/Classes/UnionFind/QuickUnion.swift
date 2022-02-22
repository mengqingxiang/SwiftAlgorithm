//
//  QuickUnion.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/22.
//


public class QuickUnion:AbstractUnionFind {
    
    public override func find(v: Int) -> Int {
        try! rangeCheck(v: v)
        
        var idx = v
        while parent[idx] != idx { idx = parent[idx] }
        return idx
    }
    
    public override func union(v: Int, v1: Int) {
        let p1 = find(v: v)
        let p2 = find(v: v1)
        if p1 == p2 { return }
        
        parent[p1] = p2
    }
    
    public override func isSame(v: Int, v1: Int) -> Bool {
        return find(v: v) == find(v: v1)
    }
}


public class QuickUnionS:QuickUnion {

    private var size:[Int] = [Int]()
    public override init(capacity: Int) {
        super.init(capacity: capacity)
        for _ in 0..<capacity {
            size.append(1)
        }
    }
    
    public override func union(v: Int, v1: Int) {
        let p1 = find(v: v)
        let p2 = find(v: v1)
        if p1 == p2 { return }
        
        if size[p1] > size[p2] {
            parent[p2] = p1
            size[p1] += size[p2]
        }else {
            parent[p1] = p2
            size[p2] += size[p1]
        }
    }
}


public class QuickUnionR:QuickUnion {

    private var rank:[Int] = [Int]()
    public override init(capacity: Int) {
        super.init(capacity: capacity)
        for _ in 0..<capacity {
            rank.append(1)
        }
    }
    
    public override func union(v: Int, v1: Int) {
        let p1 = find(v: v)
        let p2 = find(v: v1)
        if p1 == p2 { return }
        
        if rank[p1] > rank[p2] {
            parent[p2] = p1
        }else if rank[p1] < rank[p2]{
            parent[p1] = p2
        } else {
            parent[p1] = p2
            rank[p2] += 1
        }
    }
}

public class QuickUnionR_PC:QuickUnionR {

    public override func find(v: Int) -> Int {
        try! rangeCheck(v: v)
        if parent[v] != v {
            parent[v] = find(v: parent[v])
        }
        return parent[v]
    }
}

public class QuickUnionR_PS:QuickUnionR {

    public override func find(v: Int) -> Int {
        try! rangeCheck(v: v)
        var idx = v
        while idx != parent[idx] {
            let p = parent[idx]
            parent[idx] = parent[parent[idx]]
            idx = p
        }
        return idx
    }
}
