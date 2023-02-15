import Foundation

func solution(_ weights:[Int]) -> Int64 {
    
    var arr = [Int64](repeating: 0, count: 1001)
    for weight in weights {
        arr[weight] += 1
    }
    
    var result: Int64 = 0
    for i in 100...1000 {
        result += arr[i] * (arr[i] - 1)
        for mate in matesPossible(i) {
            result += arr[i] * arr[mate]
        }
    }
    
    return result / 2
}

func matesPossible(_ num: Int) -> [Int] {
    var list = [Int]()
    list += [num * 2]
    
    if num % 2 == 0 {
        list += [num/2]
        list += [num * 3 / 2]
    }
    
    if num % 3 == 0 {
        list += [num * 2 / 3]
        list += [num * 4 / 3]
    }
    
    if num % 4 == 0 {
        list += [num * 3 / 4]
    }
    return list.filter { $0 >= 100 && $0<=1000 }
}

func isSuitableCondition(_ maxNum: Int, _ minNum: Int) -> Bool {
    return maxNum == minNum * 2 || maxNum * 2 == minNum * 3 || maxNum * 3 == minNum * 4
}
