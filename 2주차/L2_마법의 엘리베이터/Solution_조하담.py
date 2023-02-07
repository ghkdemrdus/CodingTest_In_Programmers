from collections import deque

def bfs(start):
    min_count = int(1e9)
    q = deque([(start, 0)])
    while q:
        curr_n, curr_count = q.popleft()
        if curr_n == 0:
            min_count = min(min_count, curr_count)
            continue
        nameogee = curr_n % 10  
        next_n = curr_n // 10
        if curr_count+nameogee <= min_count:
            q.append((next_n, curr_count+nameogee))
        if curr_count+10-nameogee <= min_count:
            q.append((next_n+1, curr_count+10-nameogee))
    return min_count

def solution(storey):
    answer = bfs(storey)
    return answer