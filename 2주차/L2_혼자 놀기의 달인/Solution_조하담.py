def game(idx, arr, visited):
    visited_idx_list = []
    
    while True:
        if visited[idx]:
            break;
        visited[idx] = True
        visited_idx_list.append(idx)
        idx = arr[idx]-1
                         
    return visited_idx_list

def solution(cards):
    answer = 0
    v = [False] * len(cards)
    for i in range(len(cards)):
        v = [False] * len(cards)
        first_visited_idx_list = game(i, cards, v)
        tmp = list(filter(lambda x: v[x] == False, range(len(v))))
        for j in tmp:
            second_visited_idx_list = game(j, cards, v)
            answer = max(answer, len(first_visited_idx_list)*len(second_visited_idx_list))
    return answer