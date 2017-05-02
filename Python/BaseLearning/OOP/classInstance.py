class Student(object):
    """docstring for Student."""
    pass

bart = Student()
print(bart)
print(Student)

class Student(object):
    """docstring for Student."""
    def __init__(self, name, score):
        self.name = name
        self.score = self.score

def print_score(std):
     print('%s: %s' % (std.name, std.score))

class Student(object):
    """docstring for Student."""
    def __init__(self, name, score):
        self.name = name
        self.score = score

    def print_score(self):
        print('%s: %s' % self.name,self.score)

    def get_grade(self):
        if self.score >= 90:
            return 'A'
        elif self.score >= 60:
            return 'B'
        else:
            return 'C'

bart = Student()
bart.print_score()
