def solution(n):
    next_n = n+1
    while True:
        if bin(n).count('1') == bin(next_n).count('1'):
            break
        next_n += 1
    answer = next_n
    return answer