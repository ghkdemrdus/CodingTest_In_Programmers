import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var result = -1
    
    
    func dfs(_ currentNum: Int, _ cnt: Int) {
        if currentNum == number {
            if result == -1 { result = cnt}
            else { result = min(cnt, result) }
        }
        
        var NN = N
        var tmpCnt = 1
        while tmpCnt + cnt <= 8 {
            dfs(currentNum + NN, cnt + tmpCnt)
            dfs(currentNum - NN, cnt + tmpCnt)
            dfs(currentNum / NN, cnt + tmpCnt)
            dfs(currentNum * NN, cnt + tmpCnt)
            NN = NN * 10 + N
            tmpCnt += 1
        }
    }
    dfs(0, 0)
    return result
}
