print(list(range(1,11)))
L = []
print([x * x for x in range(1,11)])
print([m + n for m in 'ABC' for n in 'XYZ'])

import os
print([d for d in os.listdir('.')])

d = {'x':'A','y':'B','z':'C'}
for k,v in d.items():
    print(k,'=',v)

L = ['Hello','World','IBM','Apple']
print([s.lower() for s in L])

L1 = ['Hello', 'World', 18, 'Apple', None]
L2 = [x.lower() for x in L1 if isinstance(x,str)]
print(L2)
