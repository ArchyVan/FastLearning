class Animal(object):
    """docstring for Animal."""
    def run(self):
        print('Animal is running...')

class Dog(Animal):
    def run(self):
        print('Dog is running')

    def Cat(self):
        print('Eating meat...')

class Cat(Animal):
    def run(self):
        print('Cat is running')

a = list()
b = Animal()
c = Dog()

print(isinstance(a, list))
print(isinstance(b, Animal))
print(isinstance(c, Dog))
print(isinstance(c, Animal))

def run_twice(animal):
    animal.run()
    animal.run()

run_twice(Animal())
run_twice(Dog())

class Tortoise(Animal):
    def run(self):
        print('Tortoise is running slowly')

run_twice(Tortoise())

class Timer(object):
    def run(self):
        print('Start...')
