class Animal(object):
    """docstring for Animal."""
    def run(self):
        print('Animal is running...')

class Dog(object):
    """docstring for Dog."""
    pass

class Cat(object):
    """docstring for Cat."""
    pass

class Dog(Animal):
    """docstring for Dog."""
    def run(self):
        print('Dog is running...')

    def eat(self):
        print('Eating meat...')
