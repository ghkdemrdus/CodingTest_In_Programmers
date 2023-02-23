from collections import deque
import copy

def bfs(start, graph, visited):
        top_count = 0
        q = deque([start])
        visited[start] = True
        
        while q:
            curr_node = q.popleft()
            top_count += 1
            for next_node in graph[curr_node]:
                if not visited[next_node]:
                    q.append(next_node)
                    visited[next_node] = True
        
        return top_count

def solution(n, wires):
    answer = int(1e9)
    origin_graph = {}
    
    for (a, b) in wires:
        if not origin_graph.get(a):
            origin_graph[a] = []
        if not origin_graph.get(b):
            origin_graph[b] = []
        origin_graph[a].append(b)
        origin_graph[b].append(a)
    
    for (a, b) in wires:
        visited = [False] * (n+1)
        g = copy.deepcopy(origin_graph)
        g[a].remove(b)
        g[b].remove(a)
        a_top_count = bfs(a, g, visited)
        b_top_count = bfs(b, g, visited)
        answer = min(answer, abs(a_top_count - b_top_count))
    
    return answer