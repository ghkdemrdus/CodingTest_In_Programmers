def solution(land):
    for i in range(1, len(land)):
        for j in range(4):
            candi = land[i-1][:]
            candi.pop(j)
            land[i][j] += max(candi)
            
    answer = max(land[len(land)-1])
    return answer