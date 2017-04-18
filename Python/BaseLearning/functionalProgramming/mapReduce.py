#Map
def f(x):
    return x * x

r = map(f, [1,2,3,4,5,6,7,8,9])
print(list(r))

print(list(map(str,[1,2,3,4,5,6,7,8,9])))
#Reduce
reduce(f,[x1,x2,x3,x4])
from functools import reduce
def add(x, y):
    return x + y

reduce(add,[1,3,5,7,9])

def fn(x,y):
    return x * 10 + y

def char2num(s):
    return {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}[s]

reduce(fn,map(char2num, '13579'))

def str2int(s):
    def fn(x, y):
        return x * 10 + y
    def char2num(s):
        return {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}[s]
    return reduce(fn, map(char2num, s))
