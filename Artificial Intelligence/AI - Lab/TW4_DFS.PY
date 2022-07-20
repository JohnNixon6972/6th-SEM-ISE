import sys
from collections import defaultdict
import os
try:
    sys.stdin = open('./input.txt', 'r')
    sys.stdout = open('./output.txt', 'w')
except:
    pass


class Graph:
    def __init__(self):
        self.graph = defaultdict(list)
        self.parent = [-1 ]*9


    def addEdge(self,u,v):
        self.graph[u].append(v) 

    def find_path(self,goal):
        print("Goal Node Found!!")
        print("Path traced : ")
        node = goal
        while node != 0:
            print(node,end=",")
            node = self.parent[node]
        print(0)

    def DFS(self,source,goal):
        self.parent[source] = source
        visited = []
        stack = []

        stack.append(source)

        while stack:
            # print(self.parent)
            top = stack.pop(0)
            if top == goal:
                self.find_path(top)
                return
            # print(top,end=",")
            children_top = self.graph[top]
            children = []
            for child in children_top:
                if child not in stack and child not in visited:
                    self.parent[child] = top
                    children.append(child)
            stack = children+stack
            # print(stack)
            visited.append(top)

        print("Goal node not present")


DFS_Graph = Graph()
DFS_Graph.addEdge(0,1)
DFS_Graph.addEdge(0,2)
DFS_Graph.addEdge(0,3)
DFS_Graph.addEdge(2,4)
DFS_Graph.addEdge(3,5)
DFS_Graph.addEdge(3,6)
DFS_Graph.addEdge(4,5)
DFS_Graph.addEdge(4,7)
DFS_Graph.addEdge(5,3)
DFS_Graph.addEdge(7,8)
# print(DFS_Graph.graph)



DFS_Graph.DFS(0,10)