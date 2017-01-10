class Student(object):
    pass

bart = Student()
print(bart)
print(Student)

bart.name = 'Bart Simpson'
print(bart.name)

class Student(object):
    """docstring for Student."""
    def __init__(self, name, score):
        self.name = name
        self.score = score

    def print_score(self):
        print('%s: %s' % (self.name, self.score))

    def get_grade(self):
        if self.score >= 90:
            return 'A'
        elif self.score >= 60"
            return 'B'
        else:
            return 'C'

bart = Student('Bart Simpson', 59)
bart.age = 8
print(bart.name)
print(bart.age)
