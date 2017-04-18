d = {'a':1,'b':2,'c':3}
for key in d:
    print(key)

for ch in 'ABC':
    print(ch)

from collection import Iterable
print(isinstance('abc',Iterable))

for i , value in enumerate(['A','B','C']):
    print(i,value)

print(isinstance(iter([]),Iterable))
