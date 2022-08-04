import sys
import os
# if not os.environ.get("ONLINE_JUDGE"):
#     sys.stdin = open('./in.txt', 'r')
#     sys.stdout = open('./out.txt', 'w')
 
from collections import defaultdict
 
 
class Graph:
    def __init__(self):
        self.graph = defaultdict(list)
 
    def addEdge(self, u, v):
        self.graph[u].append(v)
 
    def BFS(self, source, n):
        visited = []
 
        queue = []
 
        queue.append(source)
        visited.append(source)
 
        while queue:
            next = queue.pop(0)
            print(next, end=" ")
 
            for child in self.graph[next]:
                if child not in visited:
                    queue.append(child)
                    visited.append(child)
 
 
BFS_graph = Graph()

BFS_graph.addEdge(0,1)
BFS_graph.addEdge(0,3)
BFS_graph.addEdge(0,2)
BFS_graph.addEdge(2,4)
BFS_graph.addEdge(3,5)
BFS_graph.addEdge(5,2)
BFS_graph.addEdge(3,6)
BFS_graph.addEdge(3,5)
BFS_graph.addEdge(6,5)
BFS_graph.addEdge(2,4)
BFS_graph.addEdge(4,5)
BFS_graph.addEdge(4,7)
BFS_graph.addEdge(7,8)
 
BFS_graph.BFS(0, 9)