import Foundation

var visited = [[Bool]]()
var info = [[Character]]()
var result = [Int]()
var tmp = 0
var dirs = [(1,0), (-1,0), (0,1), (0, -1)]

func solution(_ maps:[String]) -> [Int] {
    
    info = maps.map { Array($0) }
    visited = [Array](repeating: [Bool](repeating: false, count: maps[0].count), count: maps.count)

    for y in 0..<info.count {
        for x in 0..<info[0].count {
            if info[y][x] != "X" && !visited[y][x] {
                dfs(y,x)
                result += [tmp]
                tmp = 0
            }
        }
    }
    return result.count > 0 ? result.sorted(by: <) : [-1]
}

func dfs(_ y: Int, _ x: Int) {
    if isOutOfRange(y,x) { return }
    if visited[y][x] || info[y][x] == "X" { return }
    visited[y][x] = true
    tmp += Int(String(info[y][x]))!
    for dir in dirs {
        dfs(y + dir.0, x + dir.1)
    }
}

func isOutOfRange(_ y: Int, _ x: Int) -> Bool {
    return y < 0 || y >= info.count || x < 0 || x >= info[0].count
}
