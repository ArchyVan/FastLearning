def now():
    print('2015-3-25')

f = now
f()

print(now.__name__)
print(f.__name__)

def log(func):
    def wrapper(*args,**kw):
        print('call %s():' % func.__name__)
        return func(*args,**kw)
    return wrapper

@log
def now():
    print('2017-4-18')

now()

def log(text):
    def decorator(func):
        def wrapper(*args, **kw):
            print('%s %s():' % (text, func.__name__))
            return func(*args, **kw)
        return wrapper
    return decorator

@log('excute')
def now():
    print('2017-4-19')

now()


import functools
def log(func):
    @functools.wraps(func)
    def wrapper(*args,**kw):
        print('call %s():' % func.__name__)
        return func(*args,**kw)
    return wrapper


def log(text):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kw):
            print('%s %s():' % (text, func.__name__))
            return func(*args, **kw)
        return wrapper
    return decorator


def log(args):
    if isinstance(args,str):
        text=args
        def func1(func):
            @functools.wraps(func)
            def mk_log(*args,**kw):
                print('%s %s' % (text,func.__name__))
                func(*args,**kw)
                print('end')
            return mk_log
        return func1
    else:
        func = args
        @functools.wraps(func)
        def mk_log(*arg,**kw):
            print('begin call %s' % func.__name__)
            func(*arg,**kw)
            print('end call %s' % func.__name__)
        return mk_log

@log
def say_hello(name):
    print('hello %s' % name)

@log('use')
def say_hi(name):
    print('hi %s' % name)

say_hello('Jack')
print(say_hello.__name__)
say_hi('Jack')
print(say_hi.__name__)
