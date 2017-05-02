class Animal(object):
    pass

# 大类:
class Mammal(Animal):
    pass

class Bird(Animal):
    pass

# 各种动物:
class Dog(Mammal):
    pass

class Bat(Mammal):
    pass

class Parrot(Bird):
    pass

class Ostrich(Bird):
    pass

class Runnable(object):
    def run(self):
        print('Running...')

class Flyable(object):
    def fly(self):
        print('Flying...')

class Dog(Mammal, Runnable):
    pass

class MyTCPServer(TCPServer, ForkingMixIn):
    pass

class MyUDPServer(UDPServer, ThreadingMixIn):
    pass

class MyTCPServer(TCPServer, CoroutineMixIn):
    pass
