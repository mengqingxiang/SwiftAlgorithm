//
//  ListGraph.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/19.
//

public class ListGraph<E,V>:GraphProtocol where V:Hashable,E:Hashable {
    
    private var vertexes:[E:Vertex<E,V>] = [E:Vertex<E,V>]()
    private var edges:Set<Edge<E,V>> = Set<Edge<E,V>>()
    public var vertexSize:Int { return vertexes.count }
    public var edgeSize:Int { return edges.count }
    
    public init() {}
    
    public func addEdge(from: E, to: E, weight: V) {
        let fromVertex = Vertex<E,V>(element: from)
        if  vertexes[from] == nil {
            vertexes[from] = fromVertex
        }
        
        
        let toVertex = Vertex<E,V>(element: to)
        if  vertexes[to] == nil {
            vertexes[to] = toVertex
        }
        
        let newEdge = Edge(from: fromVertex, to: toVertex, weight: weight)
        if  edges.remove(newEdge) == nil {
            fromVertex.outEdges.insert(newEdge)
            toVertex.inEdges.insert(newEdge)
        }
        edges.insert(newEdge)
        
    }
    
    public func addVertex(element: E) {
        if let _ = vertexes[element] { return }
        vertexes[element] = Vertex<E,V>(element: element)
    }
    
    public func removeVertex(element: E) {
        
    }
    
    public func removeEdge(from: E, to: E) {
        
    }
    
}


extension ListGraph:CustomStringConvertible {
    public var description: String {
        var content = "顶点个数为:\(vertexes.count),边的个数为：\(edges.count)\n"
        content += "含有的顶点元素有："
        for vertex in vertexes {
            content += "\(vertex.key) "
        }
        
        content += "边是：\n"
        for edge in edges {
            content += "\(edge.from!.element!)->"
            content += "\(edge.to!.element!) weight:"
            content += "\(edge.weight!) \n"
        }
        content += "---------------------\n"
        return content
    }
}
