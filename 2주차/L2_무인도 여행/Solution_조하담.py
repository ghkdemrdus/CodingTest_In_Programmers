def bfs(start, visited, maps):
    from collections import deque
    count = 0
    x_move = [-1,1,0,0]
    y_move = [0,0,-1,1]
    height = len(maps)
    width = len(maps[0])
    
    q = deque([start])
    visited[start[0]][start[1]] = True
    
    while q:
        curr_x, curr_y = q.popleft()
        count += int(maps[curr_x][curr_y])
        
        for i in range(4):
            next_x, next_y = curr_x+x_move[i], curr_y+y_move[i]
            if 0<=next_x<height and 0<=next_y<width:
                if maps[next_x][next_y] != 'X' and not visited[next_x][next_y]:
                    visited[next_x][next_y] = True
                    q.append((next_x, next_y))
    
    return count

def solution(maps):
    answer = []
    height = len(maps)
    width = len(maps[0])
    visited = [[False] * width for _ in range(height)]
    
    for i in range(height):
        for j in range(width):
            if maps[i][j] != 'X' and not visited[i][j]:
                count = bfs((i,j), visited, maps)
                answer.append(count)
    
    answer.sort()
    if len(answer) == 0:
        answer.append(-1)
    return answer