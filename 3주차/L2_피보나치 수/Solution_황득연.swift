func solution(_ n:Int) -> Int {
    
    var dp = [Int](repeating: 0, count: n+1)
    
    func fibonacci(_ n: Int) -> Int {
        if n == 1 || n == 2 {
            return 1
        }
        if dp[n-1] == 0 {
            dp[n-1] = fibonacci(n-1)
        }
        
        if dp[n-2] == 0 {
            dp[n-2] = fibonacci(n-2)
        }
        return (dp[n-1] + dp[n-2]) % 1234567
    }
    return fibonacci(n)
}
