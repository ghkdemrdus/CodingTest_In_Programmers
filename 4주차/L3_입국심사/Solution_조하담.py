
def solution(n, times):
    answer = 0
    start = 1
    end = times[-1]*n
    
    times.sort()
    
    while start <= end:  
        mid = (start + end) // 2
        people = 0
        
        for i, v in enumerate(times):
            people += mid // v
        
        if people >= n:
            answer = mid
            end = mid-1
        else:
            start = mid+1
        
    return answer