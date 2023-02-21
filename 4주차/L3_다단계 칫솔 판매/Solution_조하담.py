from collections import deque
def solution(enroll, referral, seller, amount):
    answer = []
    fees = {}
        
    # 그래프 생성
    g = {}
    for i, v in enumerate(enroll):
        g[v] = referral[i]
        fees[v] = 0

    def calc(amount):
        ref_fee = amount // 10
        my_fee = amount - ref_fee
        return my_fee, ref_fee
        
    def bfs(start, amount):
        ref = g[start]
        my_fee, ref_fee = calc(amount)
        fees[start] += my_fee
        q = deque([(ref, ref_fee)])
        
        while q:
            curr_node, curr_amount = q.popleft()
            if curr_node == '-':
                continue
            curr_ref = g[curr_node]
            curr_my_fee, curr_ref_fee = calc(curr_amount)
            fees[curr_node] += curr_my_fee
            if curr_ref_fee > 0:
                q.append((curr_ref, curr_ref_fee))
            
    # 수익 계산
    for i, v in enumerate(seller):
        amt = amount[i]
        # 수익 배분
        bfs(v, amt*100)
    
    for e in enroll:
        for fk, fv in fees.items():
            if fk == e:
                answer.append(fv)
        
    return answer