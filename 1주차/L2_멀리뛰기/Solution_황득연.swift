var dp = [Int](repeating: 0, count: 2001)

func solution(_ n:Int) -> Int {
    return step(n)
}

func step(_ n: Int) -> Int {
    if n == 1 {
        return 1
    } else if n == 2 {
        return 2
    }
    
    if dp[n] != 0 {
        return dp[n]
    }
    
    let sum = (step(n-1) + step(n-2)) % 1234567
    dp[n] = sum
    return sum
}
