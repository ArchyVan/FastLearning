class Student(object):
    """docstring for Student."""
    def __init__(self,name):
        self.name = name

    def __str__(self):
        return 'Student object (name: %s)' % self.name

    __repr__ = __str__

class Fib(object):
    """docstring for fib."""
    def __init__(self):
        self.a, self.b = 0 , 1

    def __iter__(self):
        return self

    def __next__(self):
        self.a, self.b = self.b, self.a + self.b
        if self.a > 100000:
            raise StopIteration()
        return self.a

    def __getitem__(self,n):
        if isinstance(n, int):
            a, b = 1, 1
            for x in range(n):
                a,b = b, a + b
            return a
        if isinstance(n,slice):
            start = n.start
            stop = n.stop
            if start is None:
                start = 0
            a,b = 1, 1
            L = []
            for x in range(stop):
                if x >= start:
                    L.append(a)
                a, b = b, a + b
            return L

for n in Fib():
    print(n)

class Student(object):
    """docstring for Student."""
    def __init__(self):
        self.name = 'Michael'

    def __getattr__(self,attr):
        if attr == 'score'
            return 99
        if attr == 'age':
            return lambda: 25
        return AttributeError('\'Student\' object has no attribute \'%s\'' % attr)

s = Student()

class Chain(object):
    """docstring for Chain."""
    def __init__(self, path='GET '):
        self._path = path

    def __getattr__(self, path):
        return Chain('%s/%s' % (self._path, path))

    def __call__(self,path):
        return Chain('%s/%s' % (self.__path, path))

    def __str__(self):
        return self._path

Chain().status.user.timeline.list

class Student(object):
    """docstring for Student."""
    def __init__(self, name):
        self.name = name

    def __call__(self):
        print('My name is %s.' % self.name)

print(callable(Student()))
