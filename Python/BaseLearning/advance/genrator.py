L = [x * x for x in range(10)]
print(L)
g = (x * x for x in range(10))
print(g)

print(next(g))
print(next(g))
print(next(g))

for n in g:
    print(n)

def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        yield b
        a, b = b , a + b
        n = n + 1
    return 'done'

g = fib(6)
while True:
    try:
        x = next(g)
        print('g:',x)
    except StopIteration as e:
        print('Generator return value:',e.value)
        break

def triangles():
    L = [1]
    while True:
        yield L
        L = [L[0]] + [L[i]+L[i+1] for i in range(len(L) - 1)] + [L[-1]]

n = 0
for t in triangles():
    print(t)
    n = n + 1
    if n == 10:
        break
