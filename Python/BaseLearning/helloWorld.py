#Base
print('hello, world')
print(300)
print(100 + 200)
print('100 + 200 = ',100 + 200)
# name = input()
# print(name)
print('I\'m ok.')
print(r'\\\t\\')
# True
# not True
# False
# not False
# not 1 > 2
# if age >= 18:
#     print('adult')
# else:
#     print('teenager')
# a = 1
# t_007 = 'T007'
# Answer = True

print(10/3)
print(9/3)
print(10//3)
print(10%3)
print('包含中文的str')
print(ord('A'))
print(ord('中'))
print(chr(66))
print(chr(25991))
print('\u4e2d\u6587')
# %d 整数
# %f 浮点数
# %s 字符串
# %x 十六进制整数
# '中文'.encode('gb2312')

#List & Tuple
##List
classmates = ['Michael','Bob','Tracy']
print(classmates)
print(len(classmates))
classmates.append('Adam')
classmates.insert(1,'Jack')
classmates.pop()
classmates.pop(1)
classmates[1] = 'Sarah'
L = ['Apple',123,True]
s = ['python','java',['asp','php'],'scheme']
print(len(s))
L = []
print(len(L))
##Tuple
classmates = ('Michael','Bob','Tracy')
t = (1,)

#Condition
age = 20
if age >= 18:
    print('your age is',age)
    print('adult')

age = 3
if age >= 18:
    print('your age is',age)
    print('adult')
elif age >= 6:
    print('your age is',age)
    print('teenager')
else:
    print('your age is',age)
    print('kid')

#Cycle
names = ['Michael','Bob','Tracy']
for name in names:
    print(name)

sum = 0
for x in [1,2,3,4,5,6,7,8,9]:
    sum = sum + x
print(sum)
sum = 0
print(list(range(5)))
for x in range(101):
    sum = sum + x
print(sum)

sum = 0
n = 99
while n > 0:
    sum = sum + n
    n = n - 2
print(sum)

n = 1
while n <=  100:
    if n > 10:
        break
    print(n)
    n = n + 1
print('END')

n = 0
while n < 10:
    n = n + 1
    if n % 2 == 0:
        continue
    print(n)

#Dict & Set
##Dict
d = {'Michael':95,'Bob':75,'Tracy':85}
d['Adam'] = 67
d['Jack'] = 90
d.get('Thomas')
d.get('Thomas',-1)
d.pop('Bob')

##Set
s = set([1,2,3])
print(s)

s = set([1,1,2,2,3,3])
print(s)

s.add(4)
print(s)

s.remove(4)
print(s)

s1 = set([1,2,3])
s2 = set([2,3,4])
print(s1 & s2)
print(s1 | s2)

a = ['c','b','a']
a.sort()
print(a)

a = 'abc'
print(a.replace('a','A'))
print(a)
