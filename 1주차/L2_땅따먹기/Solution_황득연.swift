import Foundation

func solution(_ land:[[Int]]) -> Int{
    var score = land[0]
    
    for i in 1..<land.count {
        var tmp = score
        for j in 0..<4 {
            for k in 0..<4 {
                if j != k {
                    score[j] = max(score[j], tmp[k] + land[i][j])
                }
            }
        }
    }
    return score.max()!
}
