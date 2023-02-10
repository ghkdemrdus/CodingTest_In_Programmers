def find_parent(parents, x):
    if parents[x] != x:
        parents[x] = find_parent(parents, parents[x])
    
    return parents[x]

def union_parents(parents, a, b):
    parent_a = find_parent(parents, a)
    parent_b = find_parent(parents, b)
    
    if parent_a > parent_b:
        parents[parent_a] = parent_b
    else:
        parents[parent_b] = parent_a


def solution(n, costs):
    answer = 0
    parents = [i for i in range(len(costs)+1)]
    
    costs.sort(key = lambda x: x[2])
    
    for i in range(len(costs)):
        a, b, cost = costs[i][0], costs[i][1], costs[i][2]
        if find_parent(parents, a) != find_parent(parents, b):
            union_parents(parents, a, b)
            answer += cost
    
    return answer