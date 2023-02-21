def solution(topping):
    answer = 0
    forward_set, backward_set = set(), set()
    forward_list, backward_list = [], []
    
    for v in topping:
        forward_set.add(v)
        forward_list.append(len(forward_set))
    
    for v in topping[::-1]:
        backward_set.add(v)
        backward_list.append(len(backward_set))
    
    backward_list.sort(reverse=True)  
    
    for i in range(len(topping)-1):
        if forward_list [i] == backward_list[i+1]:
            answer += 1
    
    return answer 