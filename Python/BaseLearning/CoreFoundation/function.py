# abs(100)
# abs(-20)
# abs(12.34)
# max(1,2)
# max(2,3,1,-5)
# int('123')
# int(12.34)
# float('12.34')
# str(1.23)
# str(100)
# bool(1)
# bool('')

import math

def my_abs(x):
    if not isinstance(x, (int,float)):
        raise TypeError('bad operand type')
    if x >= 0:
        return x
    else:
        return -x

def nop():
    pass

def move(x,y,step,angle = 0):
    nx = x + step * math.cos(angle)
    ny = y - step * math.sin(angle)
    return nx,ny

x,y = move(100,100,60,math.pi / 6)
# print(x,y)
r = move(100,100,60,math.pi / 6)
# print(r)
# print(math.sqrt(4))

# def power(x):
#     return x * x
#
# print(power(5))

def power(x,n = 2):
    s = 1
    while n > 0:
        n = n - 1
        s = s * x
    return s

# print(power(5,2))
# print(power(5,3))
# print(power(5))

def enroll(name, gender,age=6,city = 'Beijing'):
    print('name:', name)
    print('gender:', gender)
    print('age:', age)
    print('city:', city)

# enroll('Bob', 'M', 7)
# enroll('Adam', 'M', city='Tianjin')

# def add_end(L=[]):
#     L.append('END')
#     return L
#
# add_end([1,2,3])
# add_end(['x','y','z'])
# add_end()
# add_end()
# add_end()

def add_end(L=None):
    if L is None:
        L = []
    L.append('END')
    return L

# add_end()

def calc(*numbers):
    sum = 0
    for n in numbers:
        sum = sum + n * n
    return sum

# print(calc(1,2,3))
# nums = [1,2,3]
# print(calc(*nums))

# def person(name, age, **kw):
#     if 'city' in kw:
#         pass
#     if 'job' in kw:
#         pass
#     print('name:' , name , 'age:', age,'other:',kw)
#
# person('Michael',30)
# person('Bob', 35, city='Beijing')

# def person(name, age, *, city = 'Beijing', job):
#     print(name, age, city, job)
#
# person('Jack', 24, city='Beijing', job='Engineer')

def f1(a, b, c=0, *args, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'args =', args, 'kw =', kw)

def f2(a, b, c=0, *, d, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'd =', d, 'kw =', kw)

# >>> f1(1, 2)
# a = 1 b = 2 c = 0 args = () kw = {}
# >>> f1(1, 2, c=3)
# a = 1 b = 2 c = 3 args = () kw = {}
# >>> f1(1, 2, 3, 'a', 'b')
# a = 1 b = 2 c = 3 args = ('a', 'b') kw = {}
# >>> f1(1, 2, 3, 'a', 'b', x=99)
# a = 1 b = 2 c = 3 args = ('a', 'b') kw = {'x': 99}
# >>> f2(1, 2, d=99, ext=None)
# a = 1 b = 2 c = 0 d = 99 kw = {'ext': None}

# >>> args = (1, 2, 3, 4)
# >>> kw = {'d': 99, 'x': '#'}
# >>> f1(*args, **kw)
# a = 1 b = 2 c = 3 args = (4,) kw = {'d': 99, 'x': '#'}
# >>> args = (1, 2, 3)
# >>> kw = {'d': 88, 'x': '#'}
# >>> f2(*args, **kw)
# a = 1 b = 2 c = 3 d = 88 kw = {'x': '#'}
