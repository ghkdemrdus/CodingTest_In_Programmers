import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    if n == 1 {
        return 0
    }
    
    var costsSorted = costs.sorted { $0[2] < $1[2]}
    var parents: [Int] = (0..<n).map{$0}
    
    var result = 0
    
    for i in 0..<costsSorted.count {
        let leftParent = parents[costsSorted[i][0]]
        let rightParent = parents[costsSorted[i][1]]
        
        if leftParent == rightParent {
            continue
        }
        
        let minN = min(leftParent, rightParent)
        let maxN = max(leftParent, rightParent)
        for j in 0..<parents.count {
            if parents[j] == maxN {
                parents[j] = minN
            }
        }
        result += costsSorted[i][2]
    }
    return result
}


// 크루스칼 알고리즘
// func solution(_ n:Int, _ costs:[[Int]]) -> Int {
//     var costSet = Set<Int>()

//     var total = 0
//     var sorted = costs.sorted { $0[2] < $1[2] }
//     for i in 0..<costs.count {
//         if sorted.count == n { break }
//         if !costSet.contains(costs[i][0]) || !costSet.contains(costs[i][1]) {
//             costSet.insert(costs[i][0])
//             costSet.insert(costs[i][1])
//             total += costs[i][2]
//         }
//     }
//     return total
// }


// dfs로 때려 박음
// var minN = 987654321
// var dict = [Int:[(Int,Int)]]()
// func solution(_ n:Int, _ costs:[[Int]]) -> Int {
   
//     for cost in costs {
//         dict[cost[0], default: []] += [(cost[1], cost[2])]
//         dict[cost[1], default: []] += [(cost[0], cost[2])]
//     }
    
//     for i in 0..<n {
//         dfs(i, n, 0, [i])
//     }
    
//     return minN
// }

// func dfs(_ s: Int, _ n: Int, _ cost: Int, _ list: [Int]) {
//     if list.count == n {
//         minN = min(minN, cost)
//         return
//     }
    
//     if dict[s, default: []].isEmpty {
//         return
//     }
    
//     var d = dict[s]!
//     for i in 0..<d.count {
//         if !list.contains(d[i].0) {
//             var listUpdated = list
//             listUpdated.append(d[i].0)
//             dfs(d[i].0, n, cost + d[i].1, listUpdated)
//         }
//     }
// }
