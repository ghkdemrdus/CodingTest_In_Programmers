import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    if jobs.count == 1 { return jobs[0][1] }
    return sjf(jobs)
}

func sjf(_ jobs: [[Int]]) -> Int {
    var jobsSorted = jobs.sorted { $0[1] < $1[1] }
    var done = [Bool](repeating: false, count: jobs.count)
    var doneCnt = 0
    
    var time = 0
    var costs = 0
    
    while doneCnt != done.count {
        var jobExisted = false
        for i in 0..<jobsSorted.count {
            if !done[i], time >= jobsSorted[i][0] {
                time += jobsSorted[i][1]
                costs += time - jobsSorted[i][0]
                done[i] = true
                doneCnt += 1
                jobExisted = true
                break
            }
        }
        if !jobExisted {
            time += 1
        }
    }
    return costs / jobs.count
}
