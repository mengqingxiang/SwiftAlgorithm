//
//  QuickFind.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/22.
//


public class QuickFind:AbstractUnionFind {
    
    public override func isSame(v:Int,v1:Int) -> Bool {
        return find(v: v) == find(v: v1)
    }
    
    public override func find(v: Int) -> Int {
        try! rangeCheck(v: v)
        return parent[v]
    }
    
    /// 0 1 2 3 4
    ///[0,1,2,3,4]
    public override func union(v: Int, v1: Int) {
        let p1 = find(v: v)
        let p2 = find(v: v1)
        if p1 == p2 { return }
        for idx in 0..<parent.count {
            if parent[idx] == p2 {
                parent[idx] = p1
            }
        }
    }
}
