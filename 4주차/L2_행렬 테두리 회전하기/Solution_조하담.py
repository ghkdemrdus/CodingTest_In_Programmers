def solution(rows, columns, queries):
    answer = []
    graph = []
    
    # 그래프 구현
    n = 1
    while n <= rows*columns:
        for i in range(rows):
            tmp = []
            for j in range(columns):
                tmp.append(n)
                n += 1
            graph.append(tmp)
    
    # 회전 진행 함수
    def change(query):
        (ax, ay, bx, by) = query
        ax, ay, bx, by = ax-1, ay-1, bx-1, by-1
        move_x = [0, 1, 0, -1]
        move_y = [1, 0, -1, 0]
        
        stack = []
        x, y = ax, ay
        tmp_value = None
        move_idx = 0
        end_value = graph[ax+1][ay]
        
        while ax <= x <= bx and ay <= y <= by:
            curr_value = graph[x][y]
            if tmp_value:
                graph[x][y] = tmp_value
            tmp_value = curr_value
            stack.append(curr_value)
            
            next_x, next_y = x+move_x[move_idx], y+move_y[move_idx]
            if ax <= next_x <= bx and ay <= next_y <= by:
                x, y = next_x, next_y
            else:
                move_idx += 1
                x, y = x+move_x[move_idx], y+move_y[move_idx]

            if x== ax and y==ay:
                break
                
        graph[ax][ay] = end_value
        
        return min(stack)
    
    # 쿼리 별 회전 진행 후, 회전에 의해 바뀐 숫자들 중 최솟값 저장
    for query in queries:
        q_min_value = change(query)
        answer.append(q_min_value)
        
    return answer