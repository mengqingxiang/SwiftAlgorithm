//
//  Graph.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/19.
//




public protocol GraphProtocol {
    associatedtype E
    associatedtype V
    
    var vertexSize:Int { get }
    var edgeSize:Int { get }
    
    func addEdge(from:E,to:E,weight:V)
    func addVertex(element:E)
    func removeVertex(element:E)
    func removeEdge(from:E,to:E)
}


internal class Vertex<E,V>where V:Hashable,E:Hashable {
    var element:E?
    var outEdges:Set<Edge> = Set<Edge<E,V>>()
    var inEdges:Set<Edge> = Set<Edge<E,V>>()
    
    init(element:E) {
        self.element = element
    }
}

extension Vertex:Hashable {
    
    static func == (lhs: Vertex<E, V>, rhs: Vertex<E, V>) -> Bool {
        return lhs.element == rhs.element
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(element)
    }
}




internal class Edge<E,V>where V:Hashable,E:Hashable {
    var from:Vertex<E,V>?
    var to:Vertex<E,V>?
    var weight:V?
    
    init(from:Vertex<E,V>,to:Vertex<E,V>,weight:V) {
        self.from = from
        self.to = to
        self.weight = weight
    }
}

extension Edge:Hashable {
    static func == (lhs: Edge<E, V>, rhs: Edge<E, V>) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(from)
        hasher.combine(to)
    }
}
