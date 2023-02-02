import Foundation


func solution(_ sticker:[Int]) -> Int{
    if sticker.count == 1 {
        return sticker[0]
    } else if sticker.count == 2 {
        return max(sticker[0], sticker[1])
    }
    
    var dp1 = [Int](repeating: 0, count: sticker.count)
    var dp2 = [Int](repeating: 0, count: sticker.count)
    
    dp1[0] = sticker[0]
    dp1[1] = sticker[0]
    
    for i in 2..<sticker.count-1 {
        dp1[i] = max(dp1[i-2] + sticker[i], dp1[i-1])
    }

    dp2[1] = sticker[1]
    
    for i in 2..<sticker.count {
        dp2[i] = max(dp2[i-2] + sticker[i], dp2[i-1])
    }

    return max(dp1.max()!, dp2.max()!)
}
