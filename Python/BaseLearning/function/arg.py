def power(x):
    return x * x

def power(x, n = 2):
    s = 1
    while n > 0:
        n = n - 1
        s = s * x
    return s

def enroll(name, gender,age = 6, city = 'Beijing'):
    print('name:',name)
    print('gender:',name)
    print('age:',age)
    print('city:',city)

def add_end(L=None)
    if L is None:
        L = []
    L.append('END')
    return L

def calc(*numbers):
    sum = 0
    for n in numbers:
        sum = sum + n * n
    return sum

def person(name, age, **kw):
    if 'city' in kw:
        pass
    if 'job' in kw:
        pass
    print('name:',name,'age:',age,'other':kw)

def person(name, age , * ,city, job):
    print(name, age ,city, job)

def person(name, age, *args, city, job):
    print(name,age,args,city,job)

def func(*args,**kw):
    pass
