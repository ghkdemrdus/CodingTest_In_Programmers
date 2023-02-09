def solution(A, B):
    answer = 0
    A.sort(reverse=True)
    B.sort()
    for i, v in enumerate(A):
        if v < B[-1]:
            answer += 1
            B.pop()  
    return answer

### 아래 코드 제출 결과, 정확성 검사는 통과했지만 효율성 검사를 통과하지 못했다.
### remove() 동작시, 해당 원소를 찾기 위해 순회한다는것을 알아차리고 코드를 개선했다.
# def solution(A, B):
#     answer = 0
#     A.sort(reverse=True)
#     for i, v in enumerate(A):
#         if v < max(B):
#             answer += 1
#             B.remove(max(B))  
#     return answer