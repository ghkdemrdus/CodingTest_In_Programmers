import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int {

    var answer = 0
    var start = 1
    for station in stations {
        let left = station - w
        let right = station + w
        if start < left {
            answer += (left - start + w * 2) / (w * 2 + 1)
        }
        start = right + 1
    }
    if start <= n {
        answer += (n - start + 1 + w * 2) / (w * 2 + 1)
    }
    
    return answer
}

// func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
//     var nextStation = 0
//     var startIdx = 1
//     var result = 0
//     for i in 0..<stations.count {
//         let nextStation = stations[i]
//         result += getCnt(nextStation - startIdx - w, w*2+1)
//         startIdx = nextStation + 1 + w
//     }
    
//     if startIdx <= n {
//         result += getCnt(n - startIdx + 1, w*2+1)
//     }
    
//     return result
// }

// func getCnt(_ cnt: Int, _ w: Int) -> Int {
//     (cnt + w - 1) / w
// }
