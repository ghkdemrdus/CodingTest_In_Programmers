import Foundation

func solution(_ s:String) -> Bool
{
    var arr = Array(s)
    var sum = 0
    for i in 0..<arr.count {
        if arr[i] == "(" {
            sum += 1
        } else {
            sum -= 1
        }
        if sum < 0 {
            return false
        }
    }
    return sum == 0
}

// func solution(_ s:String) -> Bool
// {
//     var substract = 0
//     for i in s {
//         switch i {
//             case "(":
//                 substract += 1
//             default:
//                 substract -= 1
//         }
//         if substract < 0 {
//             return false
//         }
//     }
//     if substract != 0 { return false}

//     return true
// }
