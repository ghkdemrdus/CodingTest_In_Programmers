import heapq
def solution(N, road, K):
    INF = int(1e9)
    graph = [[] for _ in range(N+1)]
    distances = [INF] * (N+1)
    
    for (a,b,c) in road:
        graph[a].append((b,c))
        graph[b].append((a,c))
    
    def dijkstra(start):
        q = []
        heapq.heappush(q, (0, start))
        distances[start] = 0
        
        while q:
            now_cost, now_node =  heapq.heappop(q)
            if distances[now_node] < now_cost:
                continue
            
            for next_node, next_cost in graph[now_node]:
                cost = now_cost + next_cost
                if cost < distances[next_node]:
                    distances[next_node] = cost
                    heapq.heappush(q, (cost, next_node))
                
    dijkstra(1)
    
    answer = len(list(filter(lambda x: x <= K, distances)))
    return answer