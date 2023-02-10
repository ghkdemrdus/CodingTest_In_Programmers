
def solution(tickets):
    answer = []
    visited = [False] * len(tickets)
    
    def dfs(node, path):
        if len(path) == len(tickets)+1:
            answer.append(path)
            return
        
        for i, t in enumerate(tickets):
            if t[0] == node:
                if not visited[i]:
                    visited[i] = True
                    dfs(t[1], path+[t[1]])
                    visited[i] = False
    
    dfs('ICN', ['ICN'])
    
    answer.sort()
    
    return answer[0]