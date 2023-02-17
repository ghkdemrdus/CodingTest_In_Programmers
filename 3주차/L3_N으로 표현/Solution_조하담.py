def solution(N, number):
    MAX_COUNT = 8
    dp = [set() for _ in range(MAX_COUNT+1)]
    dp[1].add(N)
    
    def push(num, count):
        if num > 0:
            dp[count].add(num)
    
    def calculate(first_set_num, second_set_num, count):
        dp[count].add(int(str(N)*count))
        
        for m in dp[first_set_num]:
            for n in dp[second_set_num]:                 
                push(m + n, count)
                push(m - n, count)
                push(m * n, count)
                push(m // n , count)
        
    
    for count in range(1,MAX_COUNT+1):
        for i in range(1, count):
            calculate(i, count-i, count)
        if number in dp[count]:
            return count
        
    return -1