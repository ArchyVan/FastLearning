list(map(lambda x: x * x, [1, 2, 3, 4, 5, 6, 7, 8, 9]))
def f(x):
    return x * x

f = lambda x: x * x
f
f(5)
def build(x, y):
    return lambda: x * x + y * y
