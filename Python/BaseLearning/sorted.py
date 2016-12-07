print([36,5,-12,9,-21])
sorted([36,5,-12,9,-21],key = abs)
list = [36, 5, -12, 9, -21]
keys = [36, 5, 12, 9, 21]
sorted(['bob','about','Zoo','Credit'])

sorted(['bob', 'about', 'Zoo', 'Credit'], key=str.lower)
sorted(['bob', 'about', 'Zoo', 'Credit'], key=str.lower, reverse=True)

L = [('Bob', 75), ('Adam', 92), ('Bart', 66), ('Lisa', 88)]

def by_name(t):
    return t[0]

L2 = sorted(L, key=by_name)    #按名字排序
print(L2)

def by_score(t):
    return t[1]

L3 = sorted(L, key=by_score, reverse=True)      #按成绩从高到低
print(L3)
