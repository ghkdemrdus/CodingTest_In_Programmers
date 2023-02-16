def solution(n):
    answer = []
    
    def move(pan_count, start_col, end_col, spare_col):
        if pan_count == 1:
            answer.append([start_col, end_col])
            return
        
        move(pan_count-1, start_col, spare_col, end_col)
        move(1, start_col, end_col, spare_col)
        move(pan_count-1, spare_col, end_col, start_col)
    
    move(n, 1, 3, 2)  
    return answer