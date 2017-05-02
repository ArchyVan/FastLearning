type(123)
type('str')
type(abs)
type('abc')
import types
def fn():
    pass

dir('ABC')
len('ABC')

class MyDog(object):
    """docstring for MyDog."""
    def __len__(self):
        return 100

dog = MyDog()
print(len(dog))

class MyObject(object):
    """docstring for MyObject."""
    def __init__(self):
        self.x = 9

    def power(self):
        return self.x * self.x

obj = MyObject()

hasattr(obj, 'x')
obj.x
getattr(obj, 'z', 404)

class Student(object):
    def __init__(self, name):
        self.name = name

s = Student('Bob')
s.score = 90

class Student(object):
     name = 'Student'

s = Student() # 创建实例s
print(s.name) # 打印name属性，因为实例并没有name属性，所以会继续查找class的name属性
Student
print(Student.name) # 打印类的name属性
Student
s.name = 'Michael' # 给实例绑定name属性
print(s.name) # 由于实例属性优先级比类属性高，因此，它会屏蔽掉类的name属性
Michael
print(Student.name) # 但是类属性并未消失，用Student.name仍然可以访问
Student
del s.name # 如果删除实例的name属性
print(s.name) # 再次调用s.name，由于实例的name属性没有找到，类的name属性就显示出来了
Student
