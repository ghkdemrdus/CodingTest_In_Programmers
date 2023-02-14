import Foundation

var result = [Int]()
var nodes = [[Node]]()
var tmp = 0

struct Dir {
    let dir: Int
    let value: (Int, Int)
    
    static let dirs = [Dir(dir: 0, value: (-1,0)),
                       Dir(dir: 1, value: (0,1)),
                       Dir(dir: 2, value: (1,0)),
                       Dir(dir: 3, value: (0,-1))]
}

struct Node {
    let letter: Character
    var list = [false, false, false, false]
}

func solution(_ grid:[String]) -> [Int] {
    nodes = grid.map { Array($0).map { Node(letter: $0)} }
    for y in 0..<nodes.count {
        for x in 0..<nodes[0].count {
            for dir in Dir.dirs {
                find(y,x,dir)
            }
        }
    }
    return result.sorted(by: <)
}

func find(_ y: Int, _ x: Int, _ dir: Dir) {
    if isVisited(nodes[y][x], dir.dir) {
        if tmp != 0 {
            result += [tmp]
            tmp = 0
        }
        return
    }
    nodes[y][x].list[dir.dir] = true
    tmp += 1
    
    let nextDir = findNextDir(nodes[y][x].letter, dir)
    find(findNextY(y, nextDir), findNextX(x, nextDir), nextDir)
    
}

func isVisited(_ node: Node, _ dir: Int) -> Bool {
    return node.list[dir]
}

func findNextDir(_ char: Character, _ dir: Dir) -> Dir {
    switch char {
        case "S":
            return dir
        case "L":
            return Dir.dirs[(dir.dir + 3) % 4]
        default:
            return Dir.dirs[(dir.dir + 1) % 4]
        
            
    }
}

func findNextY(_ y: Int, _ dir: Dir) -> Int {
    return (y + dir.value.0 + nodes.count) % nodes.count
}

func findNextX(_ x: Int, _ dir: Dir) -> Int {
    return (x + dir.value.1 + nodes[0].count) % nodes[0].count
}
