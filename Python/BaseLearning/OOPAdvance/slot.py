class Student(object):
    pass

s = Student()
s.name = 'Michael'
print(s.name)

def set_age(self,age):
    self.age = age

from types import MethodType
s.set_age = MethodType(set_age, s)
s.set_age(23)
print(s.age)

Student.set_score = set_score

#__slots__
class Student(object):
    """docstring for Student."""
    __slots__ = ('name', 'age')

class GraduateStudent(object):
    pass

g = GraduateStudent()
g.score = 9999
