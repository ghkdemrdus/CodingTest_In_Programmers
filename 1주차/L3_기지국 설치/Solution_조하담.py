def calc(dist, w):
    result = 0
    power_dist = 2*w+1
    if dist > 0:
        if dist % power_dist == 0:
            result =  dist // power_dist
        else:
            result =  (dist // power_dist) + 1
    return result

def solution(n, stations, w):
    answer = 0
    for i, v in enumerate(stations):
        if i == 0:
            dist = v-w-1
            answer += calc(dist, w)
        
        if i == len(stations) -1:
            if i != 0:
                dist = v-stations[i-1]-2*w-1
                answer += calc(dist, w)
            last_dist = n - v - w if v != n else 0
            answer += calc(last_dist, w)
        elif 0 < i < len(stations):
            dist = v-stations[i-1]-2*w-1
            answer += calc(dist, w)
            
    return answer