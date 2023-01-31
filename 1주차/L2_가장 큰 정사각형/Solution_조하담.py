def solution(board):    
    answer = 0
    len_row = len(board)
    len_col = len(board[0])

    for i in range(1, len_row):
        for j in range(1, len_col):
            if board[i][j] == 1:
                board[i][j] = min(board[i-1][j], board[i][j-1], board[i-1][j-1]) + 1
    
    for i in range(len_row):
        curr_max = max(board[i])
        answer = max(answer, curr_max)
    
    return answer**2