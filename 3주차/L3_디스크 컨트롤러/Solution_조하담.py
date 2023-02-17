def solution(jobs):
    answer = 0
    curr_time = 0
    job_count = len(jobs)
    jobs = sorted(jobs, key=lambda x: (x[1], x[0]))

    while jobs:
        isExist = False
        
        for i in range(len(jobs)):
            req_time, estm_time = jobs[i][0], jobs[i][1]
            if req_time <= curr_time:
                isExist = True
                curr_time += estm_time 
                answer += curr_time - req_time
                jobs.pop(i)
                break    
        
        if not isExist:
            curr_time += 1

    return answer // job_count