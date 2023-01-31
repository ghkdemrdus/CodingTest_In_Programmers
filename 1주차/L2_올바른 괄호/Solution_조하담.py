def solution(s):
    stack = []
    OPENER = '('
    CLOSER = ')'
    for b in s:
        if b == CLOSER:
            if stack and stack[-1] == OPENER: 
                stack.pop()
                continue
        stack.append(b)
    answer = True if not stack else False
    return answer