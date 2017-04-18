print(abs(-10))
print(abs)
x = abs(-10)
print(x)
f = abs
print(f)
print(f(-20))
def add(x, y, f):
    return f(x) + f(y)

x = -5
y = 6
f = abs
add(x,y,f)
