def solution(A, B):
    answer = 0
    A.sort(reverse=True)
    B.sort()
    for i, v in enumerate(A):
        if v < B[-1]:
            answer += 1
            B.pop()  
    return answer