func solution(_ s:String) -> String {
    let arr = s.components(separatedBy: " ").map{ Int($0)! }
    let maxN = arr.max()!
    let minN = arr.min()!
    return "\(minN) \(maxN)"
}
