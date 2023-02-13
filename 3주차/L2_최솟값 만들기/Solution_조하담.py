def solution(A,B):
    answer = 0
    A.sort()
    B.sort(reverse=True)
    while A:
        answer += (A.pop() * B.pop())
    return answer


# 아래 코드는 bfs 활용해서 풀었던 코드 => 시간 초과 발생.
# 그리디로 생각 전환해서 다시 풀었음.
# from collections import deque
# def solution(A,B):
#     sum_products_list = []
#     n = len(A)
    
#     def bfs(A_start, B_start, sum_products, A_visited, B_visited):
#         A_visited[A_start] = True
#         B_visited[B_start] = True
#         sum_products += (A[A_start] * B[B_start])
#         q = deque([(A_start, B_start, sum_products, A_visited, B_visited)])
        
#         while q:
#             A_start, B_start, sum_products, A_visited, B_visited = q.popleft()
#             if False not in A_visited:
#                 sum_products_list.append(sum_products)
#             for a in range(n):
#                 if not A_visited[a]:
#                     for b in range(n):
#                         if not B_visited[b]:
#                             A_visited[a] = True
#                             B_visited[b] = True
#                             sum_products += (A[a] * B[b])
#                             q.append((a, b, sum_products, A_visited[:], B_visited[:]))
#                             A_visited[a] = False
#                             B_visited[b] = False

#     if n == 1:
#         return A[0] * B[0]
    
#     for i in range(n):
#         for j in range(n):
#             A_visited = [False] * n
#             B_visited = [False] * n
#             bfs(i, j, 0, A_visited, B_visited)
    
#     answer =  min(sum_products_list)
#     return answer