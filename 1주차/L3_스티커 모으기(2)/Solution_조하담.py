def solution(sticker):
    if len(sticker) <= 2:
        return max(sticker)
    
    # case 1: 첫 번째 스티커를 떼는 경우 -> 마지막 스티커 못 뗀다
    dp_1 = [0]*(len(sticker))
    dp_1[0] = sticker[0]
    dp_1[1] = sticker[0]
    for i in range(2, len(sticker)-1):
        dp_1[i] = max(dp_1[i-2]+sticker[i], dp_1[i-1])
    
    # case 2: 첫 번째 스티커를 안 떼는 경우 -> 마지막 스티커 뗄 수 있다
    dp_2 = [0]*(len(sticker))
    dp_2[0] = 0
    dp_2[1] = sticker[1]
    for i in range(2, len(sticker)):
        dp_2[i] = max(dp_2[i-2]+sticker[i], dp_2[i-1])

    answer = max(max(dp_1), max(dp_2))
    return answer