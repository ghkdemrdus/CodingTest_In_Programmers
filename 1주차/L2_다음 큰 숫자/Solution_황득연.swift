import Foundation

func solution(_ n:Int) -> Int
{
    var answer = n + 1
    var origin = toBinaryList(n).filter {$0 == 1}.count
    while true {
        let cnt = toBinaryList(answer).filter { $0 == 1}.count
        if origin == cnt {
            return answer
        }
        answer += 1
    }
    return answer
}

func toBinaryList(_ n: Int) -> [Int] {
    var num = n
    var list = [Int]()
    while true {
        let q = num % 2
        list += [q]
        num = num / 2
        if num == 0 {
            break
        }
    }
    return list
}


// func solution(_ n:Int) -> Int
// {
//     var answer:Int = 0
    
//     var value = n
//     var oneFirst = false
//     var sum = 0
//     var oneCount = 0
//     var idx = 0

//     while value != 0 {
//         let remainer = value % 2
//         value /= 2
        
//         if remainer == 1 {
//             oneCount += 1
//             sum += second(idx)
//         }
        
//         if !oneFirst && remainer == 1 {
//             oneFirst = true
//         }
        
//         if oneFirst && remainer == 0 {
//             break
//         }
//         idx += 1
//     }
    
//     answer = n + second(idx) + sumA(oneCount - 1) - sum
//     return answer
// }

// func second(_ num: Int) -> Int {
//     if num == 0 {
//         return 1
//     }
//     return second(num - 1) * 2
// }

// func sumA(_ num: Int) -> Int {
//     var sum = 0
//     for i in 0..<num {
//         sum += second(i)
//     }
//     return sum
// }
