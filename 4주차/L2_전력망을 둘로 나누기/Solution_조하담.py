from collections import deque

def bfs(start, graph, visited):
        top_count = 0
        q = deque([start])
        
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
    graph = {}
    
    for (a, b) in wires:
        if not graph.get(a):
            graph[a] = []
        if not graph.get(b):
            graph[b] = []
        graph[a].append(b)
        graph[b].append(a)
    
    for (a, b) in wires:
        visited = [False] * (n+1)
        visited[a] = True
        visited[b] = True
        a_top_count = bfs(a, graph, visited)
        b_top_count = bfs(b, graph, visited)
        answer = min(answer, abs(a_top_count - b_top_count))
    
    return answer