from collections import deque
def solution(begin, target, words):
    words_set = set(words)
    answer = 0
    visited = dict()
    
    for w in words:
        visited[w] = False
        
    def find_next_words(word):
        result = []
        
        for next_word in words:
            difference = 0
            for i in range(len(next_word)):
                if word[i] != next_word[i]:
                    difference += 1
            if difference == 1:
                result.append(next_word)
        
        return result

    def bfs(start):
        count = 0
        q = deque([(start, visited.copy(), count)])
        visited[start] = True
        
        while q:
            curr_word, curr_visited, count = q.popleft()
            if curr_word == target:
                return count
            next_words = find_next_words(curr_word)

            for nw in next_words:
                next_visited = curr_visited.copy()
                if not curr_visited[nw]:
                    next_visited[nw] = True
                    q.append((nw, next_visited, count+1))

    answer = bfs(begin)
    
    return answer if answer else 0