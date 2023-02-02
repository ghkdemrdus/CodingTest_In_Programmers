# 줄세우기(순열/조합) 대신 DP를 떠올렸다면 더 간결하게 풀 수 있다.
def solution(n):
    from math import factorial
    
    answer = 1
    sets = n // 2
    
    for set_count in range(1, sets+1):
        single_count = n - 2*set_count
        bunja = factorial(set_count+single_count)
        bunmo = (factorial(set_count) * factorial(single_count))
        answer += bunja // bunmo
    
    return answer % 1234567