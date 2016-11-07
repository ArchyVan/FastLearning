print(abs(-10))
x = abs(-10)
print(x)
f = abs
print(f)
print(f(-10))

def add(x,y,f):
    return f(x) + f(y)

x = -5
y = 6
f = abs
print(add(x,y,f))
