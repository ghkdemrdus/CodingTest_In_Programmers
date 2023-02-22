from collections import deque
def solution(maps):
    move_x = [-1,0,1,0]
    move_y = [0,1,0,-1]
    len_x = len(maps)
    len_y = len(maps[0])
    
    def bfs(start, end, count):
        visited = [[False] * len_y for _ in range(len_x)]
        q = deque([(start[0], start[1], count)])
        visited[start[0]][start[1]] = True
        
        while q:
            curr_x, curr_y, curr_count = q.popleft()
            if curr_x == end[0] and curr_y == end[1]:
                return curr_count
            
            for i in range(4):
                next_x, next_y = curr_x + move_x[i], curr_y + move_y[i]
                if 0 <= next_x < len_x and 0 <= next_y < len_y:
                    if maps[next_x][next_y] != 'X' and not visited[next_x][next_y]:
                        q.append((next_x, next_y, curr_count+1))
                        visited[next_x][next_y] = True    
    
    start = -1
    lever = -1
    end = -1
    
    for i in range(len_x):
        for j in range(len_y):
            if maps[i][j] == 'S':
                start = (i,j)
            elif maps[i][j] == 'L':
                lever = (i,j)
            elif maps[i][j] == 'E':
                end = (i,j)
    
    first_count = bfs(start, lever, 0) 
    second_count = bfs(lever, end, 0)
    answer = first_count + second_count if first_count != None and second_count!= None else -1
    
    return answer