def solution(weights):
    answer = 0
    dic = {}

    for w in weights:
        if dic.get(w, 0):
            dic[w] += 1
        else:
            dic[w] = 1

    for w in weights:
        if w % 2 == 0:
            answer += dic.get(w * 3 // 2, 0)
        if w % 3 == 0:
            answer += dic.get(w * 4 // 3, 0)
        answer += dic.get(w * 2, 0)
    
    for w in weights:
        dic[w] -= 1
        answer += dic[w]
        
    return answer