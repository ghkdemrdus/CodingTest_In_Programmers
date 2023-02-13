import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var aSorted = a.sorted(by: <)
    var bSorted = b.sorted(by: <)
    var score = 0
    var bPos = 0
    for i in 0..<a.count {
        for j in bPos..<b.count {
            bPos += 1
            if bSorted[j] > aSorted[i] {
                score += 1
                break
            }
        }
    }
    
    return score
}

// func solution(_ a:[Int], _ b:[Int]) -> Int {
    
//     var sortedA = a.sorted()
//     var sortedB = b.sorted()
//     var firstIdx = 0
//     var result = 0
//     var noWin = true
//     for i in 0..<sortedA.count {
//         for j in firstIdx..<sortedB.count {
//             if sortedA[i] < sortedB[j]  {
//                 result += 1
//                 firstIdx = j + 1
//                 noWin = false
//                 break
//             }
            
//         }
//         if noWin {
//             break
//         }
//     }
    
//     return result

// }
