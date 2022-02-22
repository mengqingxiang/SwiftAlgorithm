//
//  ListGraph.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/19.
//

public class ListGraph<E,V>:GraphProtocol where V:Hashable,E:Hashable {

    public typealias E = E
    private var vertexes:[E:Vertex<E,V>] = [E:Vertex<E,V>]()
    private var edges:Set<Edge<E,V>> = Set<Edge<E,V>>()
    public var vertexSize:Int { return vertexes.count }
    public var edgeSize:Int { return edges.count }
    
    public init() {}
    
    public func addEdge(from: E, to: E, weight: V) {
        var fromVertex = vertexes[from]
        if  fromVertex == nil {
            fromVertex = Vertex<E,V>(element: from)
            vertexes[from] = fromVertex
        }
        
        
        var toVertex = vertexes[to]
        if  toVertex == nil {
            toVertex = Vertex<E,V>(element: to)
            vertexes[to] = toVertex
        }
        
        let newEdge = Edge(from: fromVertex!, to: toVertex!, weight: weight)
        if let _ = fromVertex?.outEdges.remove(newEdge) {
            toVertex?.inEdges.remove(newEdge)
            edges.remove(newEdge)
        }
        fromVertex?.outEdges.insert(newEdge)
        toVertex?.inEdges.insert(newEdge)
        edges.insert(newEdge)
        
    }
    
    public func addVertex(element: E) {
        if let _ = vertexes[element] { return }
        vertexes[element] = Vertex<E,V>(element: element)
    }
    
    public func removeVertex(element: E) {
        guard let vertex = vertexes[element] else { return }
        
        for edge in vertex.outEdges {
            edge.to?.inEdges.remove(edge)
            edges.remove(edge)
        }
        
        for edge in vertex.inEdges {
            edge.from?.outEdges.remove(edge)
            edges.remove(edge)
        }
        
        vertexes.removeValue(forKey: element)
    }
    
    public func removeEdge(from: E, to: E) {
        guard let fromVertex = vertexes[from] else { return }
        guard let toVertex = vertexes[to] else { return }
        let newEdge = Edge<E,V>.init(from: fromVertex, to: toVertex, weight: nil)
        if let _ = edges.remove(newEdge) {
            fromVertex.outEdges.remove(newEdge)
            toVertex.inEdges.remove(newEdge)
        }
        
    }
    
}

extension ListGraph {
    
    public func bfs(element: E,traverCosure:VisitorClosure?) {
        guard let visitor = traverCosure else { return }
        guard let vertex = vertexes[element] else { return }
        var queue:[Vertex<E,V>] = [Vertex<E,V>]()
        var traverSet:Set<Vertex<E,V>> = Set<Vertex<E,V>>()
        queue.append(vertex)
        traverSet.insert(vertex)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if visitor(node.element) == true { break }
            for edge in node.outEdges {
                if let toVertex = edge.to,!traverSet.contains(toVertex) {
                    queue.append(toVertex)
                    traverSet.insert(toVertex)
                }
            }
        }
    }
    
    
    public func dfs2(element: E,traverCosure:VisitorClosure?) {
        guard let visitor = traverCosure else { return }
        guard let vertex = vertexes[element] else { return }
        var traverSet = Set<Vertex<E,V>>()
        var stack:[Vertex<E,V>] = [Vertex<E,V>]()
        stack.append(vertex)
        traverSet.insert(vertex)
        visitor(vertex.element)
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            for edge in node.outEdges {
                if let toVertex = edge.to,!traverSet.contains(toVertex) {
                    stack.append(edge.from!)
                    stack.append(edge.to!)
                    traverSet.insert(toVertex)
                    visitor(edge.to?.element)
                    break
                }
            }
        }
    }
    
    public func dfs(element: E, traverCosure:VisitorClosure?) {
        guard let visitor = traverCosure else { return }
        guard let vertex = vertexes[element] else { return }
        var traverseSet:Set<Vertex<E,V>> = Set<Vertex<E,V>>()
        dfs(vertext: vertex, traverset: &traverseSet,traverCosure: visitor)
    }
    
    ///这里的visitor 返回时机有问题
    private func dfs(vertext:Vertex<E,V>,traverset:inout Set<Vertex<E,V>>,traverCosure:VisitorClosure) {
        traverset.insert(vertext)
        if traverCosure(vertext.element) == true { return }
        for edge in vertext.outEdges {
            if let toVertex = edge.to,!traverset.contains(toVertex) {
                dfs(vertext: toVertex,traverset: &traverset,traverCosure: traverCosure)
            }
        }
    }
}


extension ListGraph:CustomStringConvertible {
    public var description: String {
        var content = "Vertexes count:\(vertexes.count),Edge count：\(edges.count)\n"
        content += "All vertexes：\n"
        for vertex in vertexes {
            content += "\(vertex.key) outEdge:"
            for edge in vertex.value.outEdges {
                content += "\(edge) "
            }
            content += "\n"
        }
        
        content += "\nAll edge：\n"
        for edge in edges {
            content += "\(edge.from!.element!)->"
            content += "\(edge.to!.element!) weight:"
            content += "\(edge.weight!) \n"
        }
        content += "---------------------\n"
        return content
    }
}
