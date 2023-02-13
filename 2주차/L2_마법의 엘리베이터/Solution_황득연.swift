import Foundation

func solution(_ storey:Int) -> Int {
    var result = 0
    var d = storey
    while d != 0 {
        let q = d % 10
        var addCnt = 0
        if q > 5 {
            addCnt = 1
        } else if q == 5 {
            let q2 = d % 100 / 10
            if q2 >= 5 {
                addCnt = 1
            }
        }
        result += min(q, 10 - q)
        d = d/10 + addCnt
    }
    
    return result
}

// func solution(_ storey:Int) -> Int {
//     var a = storey
//     var result = 0

//     while a != 0 {
//         let b = a % 10
//         if b > 5 {
//             a += 10
//         } else if b == 5 {
//             if a % 100 / 10 >= 5 {
//                 a += 10
//             }
//         }
//         result += min(b, 10-b)
//         a /= 10
//     }

//     return result
// }
