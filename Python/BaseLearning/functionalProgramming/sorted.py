sorted([35,34,53,24,-1])
sorted([35,34,53,24,-1],key=abs)
sorted([35,34,53,24,-1],key=str.lower)
sorted([35,34,53,24,-1],key=str.lower,reverser=True)

L = [('Bob', 75), ('Adam', 92), ('Bart', 66), ('Lisa', 88)]

def by_name(t):
    return t[0]

def by_score(t):
    return t[1]

def order(t):
    t = sorted(t, key=by_name)
    for i in list(range(len(t) - 1)) :
        alist = [t[i]]
        for j in list(range(len(t)))[i + 1 : ]:
            if t[i][0][0] == t[j][0][0]:
                alist.append(t[j])
        L = sorted(alist, key=by_score, reverse=True)
        t = t[ : i] + L + t[i + len(L) : ]
    return t


L2 = order(L)
