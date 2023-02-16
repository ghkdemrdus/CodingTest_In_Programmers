import Foundation

func solution(_ n:Int) -> [[Int]] {
    
    func hanoi(_ n: Int, _ from: Int, _ to: Int) -> [[Int]] {
        if n == 1 {
            return [[from, to]]
        }
        return hanoi(n-1, from, findTo(from, to)) + hanoi(1, from, to) + hanoi(n-1, findTo(from, to), to)
    }
    
    // 다음 To를 찾기
    func findTo(_ from: Int, _ to: Int) -> Int {
        return [1,2,3].filter { $0 != from && $0 != to }[0]
    }
    
    return hanoi(n, 1, 3)
}
