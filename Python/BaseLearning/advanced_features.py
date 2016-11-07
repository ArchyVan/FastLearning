#切片

# L = ['Michael','Sarah','Tracy','Bob','Jack']
#
# print(L[0:3])
# print(L[:3])
# print(L[1:3])
# print(L[-2:])
# print(L[-2:-1])
# L = list(range(100))
# print(L)
# print(L[:10])
# print(L[-10:])
# print(L[10:20])
# print(L[:10:2])
# print(L[::5])
# print(L[:])
# print((0,1,2,3,4,5)[:3])
# print('ABCDEFG'[:3])

#迭代
# d = {'a':1,'b':2,'c':3}
# for key in d:
#     print(key)
#
# for ch in 'ABC':
#     print(ch)
#
# from collections import Iterable
# print(isinstance('abc',Iterable))
# print(isinstance([1,2,3],Iterable))
# print(isinstance(123,Iterable))
#
# for i, value in enumerate(['A','B','C']):
#     print(i,value)
#
# for x, y in [(1, 1), (2, 4), (3, 9)]:
#     print(x, y)

# 列表生成式
# print(list(range(1,11)))
# L = []
# for x in range(1,11):
#     L.append(x * x)
#
# print(L)
#
# print([x * x for x in range(1,11)])
# print([x * x for x in range(1,11) if x % 2 == 0])
# print([m + n for m in 'ABC'  for n in 'XYZ'])
# import os
# print([d for d in os.listdir('.')])
#
# d = {'x':'A','y':'B','z':'C'}
# for k, v in d.items():
#     print(k, '=', v)
#
# [k + '=' + v for k, v in d.items()]
# L = ['Hello','world','IBM','Apple']
# [s.lower() for s in L]

#生成器
# L = [x * x for x in range(10)]
# print(L)
# g = (x * x for x in range(10))
# print(g)
# print(next(g))
# print(next(g))
# print(next(g))

# g = (x * x for x in range(10))
# for n in g:
#     print(n)

# def fib(max):
#     n, a, b = 0, 0, 1
#     while n < max:
#         print(b)
#         a, b = b, a + b
#         n = n + 1
#     return 'done'
#
# print(fib(6))
# def fib(max):
#     n, a, b = 0, 0, 1
#     while n < max:
#         yield b
#         a, b = b, a + b
#         n = n + 1
#     return 'done'
#
# f = fib(6)

# def odd():
#     print('step 1')
#     yield 1
#     print('step 2')
#     yield(3)
#     print('step 3')
#     yield(5)
#
# o = odd()
# next(o)
# next(o)
# next(o)

# g = fib(6)
# while True:
#     try:
#         x = next(g)
#         print('g:', x)
#     except StopIteration as e:
#         print('Generator return value:',e.value)
#         break

# 杨辉三角
# def triangles():
#     L=[1]
#     while True:
#         yield L
#         L.append(0)
#         L=[L[i-1]+L[i] for i in range(len(L))]
# n=int(input('Please enter a number:'))
# m=0
# for t in triangles():
#     print(t)
#     m=m+1
#     if m==n:
#         break

#迭代器
from collections import Iterable
isinstance([],Iterable)
isinstance({},Iterable)

for x in [1,2,3,4,5]:
    pass:

it = iter([1,2,3,4,5])
while True:
    try:
        x = next(it)
    except StopIteration:
