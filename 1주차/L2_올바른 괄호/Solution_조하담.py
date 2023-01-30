def solution(s):
    stack = []
    for v in s:
        if v == ')':
            if len(stack) > 0 and stack[-1] == '(': 
                stack.pop()
                continue
        stack.append(v)
    answer = True if len(stack) == 0 else False
    return answer