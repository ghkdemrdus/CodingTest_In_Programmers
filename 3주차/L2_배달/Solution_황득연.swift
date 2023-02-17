import Foundation

func solution(_ N:Int, _ roads:[[Int]], _ k:Int) -> Int {
    
    var costs = [Int](repeating: Int.max, count: N+1)
    dijkstra(&costs, roads)
    return costs.filter {$0 <= k }.count
}

func dijkstra(_ costs: inout [Int], _ roads: [[Int]]) {
    var queue = [1]
    costs[1] = 0
    
    while !queue.isEmpty {
        var startVillage = queue.removeFirst()
        var roadsPossible = roads.filter { $0[0] == startVillage || $0[1] == startVillage }
        for road in roadsPossible {
            let nextVillage = road[0] == startVillage ? road[1] : road[0]
            if costs[startVillage] + road[2] < costs[nextVillage] {
                costs[nextVillage] = costs[startVillage] + road[2]
                if !queue.contains(nextVillage) {
                    queue += [nextVillage]
                }
            }
        }
    }
}
