import Foundation

var result = [String]()
var dict = [String: [String]]()
func solution(_ tickets:[[String]]) -> [String] {
    
    for ticket in tickets {
        dict[ticket[0], default: []] += [ticket[1]]
    }
    
    dfs("ICN", ["ICN"], 0, tickets.count)
    return result
}

func dfs(_ start: String, _ list: [String], _ cnt: Int, _ total: Int) {
    if cnt == total {
        if result.isEmpty {
            result = list
        } else {
            for i in 0..<total {
                if result[i] > list[i] {
                    result = list
                    break
                } else if result[i] < list[i] {
                    break
                }
            }
        }
        return
    }
    
    if dict[start, default: []].isEmpty { return }
    
    for i in 0..<dict[start]!.count {
        let arrive = dict[start]![i]
        dict[start]!.remove(at: i)
        dfs(arrive, list + [arrive], cnt + 1, total)
        dict[start]!.insert(arrive, at: i)
    }
}

// var result = [String]()
// var visited = [Bool]()
// func solution(_ tickets:[[String]]) -> [String] {
//     visited = [Bool](repeating: false, count: tickets.count)
//     dfs(tickets, 0, "", [])
//     return result
// }

// func dfs(_ tickets: [[String]], _ n: Int, _ start: String, _ list: [String]) {
//     if n == tickets.count {
//         if result.count == 0 {
//             result = list
//         } else {
//             for i in 0..<list.count where result.count > i {
//                 if result[i] > list[i] {
//                     result = list
//                     break
//                 } else if result[i] < list[i] {
//                     break
//                 }
//             }
//         }
//         return
//     }
    
//     let updatedList = list
    
//     if n == 0 {
//         for i in 0..<tickets.count {
//             if tickets[i][0] != "ICN" { continue }
//             visited[i] = true
//             dfs(tickets, n + 1, tickets[i][1], updatedList + [tickets[i][0], tickets[i][1]])
//             visited[i] = false
//         }
//     }
    
    
//     for i in 0..<tickets.count {
//         if !visited[i] && start == tickets[i][0] {
//             visited[i] = true
//             dfs(tickets, n + 1, tickets[i][1], updatedList + [tickets[i][1]])
//             visited[i] = false
//         }
//     }
    
// }
