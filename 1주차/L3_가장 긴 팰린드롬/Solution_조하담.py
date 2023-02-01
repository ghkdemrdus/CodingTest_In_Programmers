def move(left_idx, right_idx, s):
    length = 0
    while (0 <= left_idx < len(s)) and (0 <= right_idx < len(s)):
        if s[left_idx] == s[right_idx]:
            length = right_idx - left_idx + 1
        ### else 조건 놓쳐서 헤맸었다. 그림 그려서 코드 따라가봤으면 금방 알아차렸을지도!
        else: 
            break 
        left_idx -= 1
        right_idx += 1
    return length

def solution(s):
    max_len = 1
    for i in range(len(s)):
        case_one = 0
        case_two = 0
        if i+1 < len(s) and s[i] == s[i+1]:
            case_one = move(i, i+1, s)
        if i+2 < len(s) and s[i] == s[i+2]:
            case_two = move(i, i+2, s)
        max_len = max(max_len, case_one, case_two)
    answer = max_len
    return answer