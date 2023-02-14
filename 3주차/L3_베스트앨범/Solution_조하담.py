def solution(genres, plays):
    answer = []
    dic = {}
    genre_counts = []
    
    for i in range(len(genres)):
        if dic.get(genres[i]):
            dic[genres[i]].append((plays[i], i))
        else:
            dic[genres[i]] = [(plays[i], i)]
    
    for k, v in dic.items():
        v.sort(key=lambda x: (x[0], -x[1])) # dic value 내부 정렬
        sum_v = sum(x[0] for x in v) 
        genre_counts.append((sum_v, k)) # 장르별 재생 총 횟수 저장
    
    genre_counts.sort()
    
    while genre_counts:
        play_count, genre = genre_counts.pop()
        count = 0
        
        while dic[genre] and count < 2:
            play_count, idx = dic[genre].pop()
            answer.append(idx)
            count += 1
        
    return answer