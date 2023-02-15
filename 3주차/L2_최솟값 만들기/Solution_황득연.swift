import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    let Asorted = A.sorted()
    let Bsorted = B.sorted(by: >)
    
    for i in 0..<A.count {
        ans += Asorted[i] * Bsorted[i]
    }

    return ans
}
