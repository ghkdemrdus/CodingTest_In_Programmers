from collections import deque

def find_next_words(word, words):
        result = []
        for next_word in words:
            difference = 0
            for i in range(len(next_word)):
                if word[i] != next_word[i]:
                    difference += 1
            if difference == 1:
                result.append(next_word)
        return result
    
def solution(begin, target, words):
    if target not in words:
        return 0

    count = 0
    q = deque([(begin, count)])

    while q:
        curr_word, count = q.popleft()
        if curr_word == target:
            return count
        next_words = find_next_words(curr_word, words)
        for nw in next_words:
            q.append((nw, count+1))
    
    return answer if answer else 0