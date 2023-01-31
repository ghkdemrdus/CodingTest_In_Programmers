import Foundation

func solution(_ board:[[Int]]) -> Int
{
    // 2차원 배열
    let y = board.count
    let x = board[0].count
    
    var maxN = 0
    
    // (x,y) 튜플
    var boardCnt = Array(repeating: Array(repeating: (0,0), count: x), count: y)
    for i in 0..<y {
        for j in 0..<x {
            if board[i][j] == 0 {
                continue
            }
            
            if i == 0, j == 0 {
                boardCnt[i][j] = (1,1)
            } else if i == 0 {
                boardCnt[i][j] = (boardCnt[i][j-1].0 + 1, 1)
            } else if j == 0 {
                boardCnt[i][j] = (1, boardCnt[i-1][j].1 + 1)
            } else {
                let nextX = min(boardCnt[i-1][j-1].0, boardCnt[i-1][j].0, boardCnt[i][j-1].0) + 1
                let nextY = min(boardCnt[i-1][j-1].1, boardCnt[i-1][j].1, boardCnt[i][j-1].1) + 1
                boardCnt[i][j] = (nextX, nextY)
            }
            
            maxN = max(maxN, min(boardCnt[i][j].0, boardCnt[i][j].1))
        }
    }
    
    return maxN * maxN
}

// func solution(_ board:[[Int]]) -> Int
// {
//     var answer:Int = 0
//     var square = board
//     let xLength = board[0].count
//     let yLength = board.count

//     if xLength == 1 || yLength == 1 {
//         for y in 0..<yLength {
//             for x in 0..<xLength {
//                 answer = max(answer, board[y][x])
//             }
//         }
//         return answer
//     }
    
//     for y in 1..<yLength {
//         for x in 1..<xLength {
//             if board[y][x] != 0 {
//                 square[y][x] = min(square[y-1][x], square[y][x-1], square[y-1][x-1]) + 1
//                 answer = max(answer, square[y][x])
//             }
//         }
//     }
    
//     return answer * answer
// }
