class Student(object):
    """docstring for Student."""
    def __init__(self, name, score):
            self.__name = name
            self.__score = score

    def print_score(self):
        print('%s: %s' % (self.__name,self.__score))

    def get_name(self):
        return self.__name

    def get_score(self):
        return self.__score

    def set_score(self, score):
        if 0 <= score <= 100:
            self.__score = score
        else:
            raise ValueError('bad score')



bart = Student('Bart Simpson',98)
print(bart._Student__name)
# print(bart.__name)
print(bart.get_name())
