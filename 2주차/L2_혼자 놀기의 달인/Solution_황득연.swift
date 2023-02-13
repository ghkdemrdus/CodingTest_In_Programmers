import Foundation

func solution(_ cards:[Int]) -> Int {
    var visited = [Bool](repeating: false, count: cards.count)
    var cnts = [Int]()
    
    for i in 0..<cards.count {
        if !visited[i] {
            var s = i
            var cnt = 0
            while !visited[s] {
                visited[s] = true
                s = cards[s] - 1
                cnt += 1
            }
            cnts += [cnt]
        }
    }
    
    if cnts.count == 1 {
        return 0
    }
    
    cnts.sort(by: >)
    return cnts[0] * cnts[1]
}

// func solution(_ cards:[Int]) -> Int {
//     var groups = [Int]()
//     var total = cards.count
//     var arr = [Bool](repeating: false, count: total)
    
//     func findGroup(_ idx: Int) -> Int {
//         var cnt = 0

//         let oldVal = idx
//         var newVal = idx
//         repeat {
//             newVal = cards[newVal] - 1
//             cnt += 1
//             arr[newVal] = true
//         } while (oldVal != newVal)

//         return cnt
//     }
    
//     for i in 0..<arr.count {
//         if !arr[i] {
//           groups  += [findGroup(i)]
//         }
//     }
    
//     if groups.count < 2 {
//         return 0
//     }
//     let sorted = groups.sorted(by: >)
    
//     return sorted[0] * sorted[1]
// }

