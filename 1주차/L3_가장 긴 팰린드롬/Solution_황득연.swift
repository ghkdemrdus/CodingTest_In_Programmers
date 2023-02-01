import Foundation

func solution(_ s:String) -> Int {
    var result = 1
    let arr = Array(s)
    for i in 0..<arr.count {
        for j in stride(from: arr.count-1, to: i, by: -1) {
            if j - i + 1 <= result {
                continue
            }
            var left = i
            var right = j
            while left < right, arr[left] == arr[right] {
                left += 1
                right -= 1
            }
            if left >= right {
                result = max(result, j - i + 1)
            }
        }
    }
    return result
}
