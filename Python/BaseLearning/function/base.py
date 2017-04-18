print(abs(-100))
print(max(1,2,3,4))

def my_abs(x):
    if not isinstance(x,(int,float)):
        raise TypeError('bad operand type')
    if x >= 0:
        return x
    else:
        return -x

def nop():
    pass

import math

def move(x,y,step,angle=0):
    nx = x + step * math.cos(angle)
    ny = y - step * math.sin(angle)
    return nx,ny


def quadratic(a, b, c):
    if not isinstance(a, (int, float)):
        raise TypeError('bad operand type(a)')
    if not isinstance(b, (int, float)):
        raise TypeError('bad operand type(b)')
    if not isinstance(c, (int, float)):
        raise TypeError('bad operand type(c)')

    if a == 0:
        if b == 0 and c != 0:
            return '无解'
        elif b == 0 and c == 0:
            return 'x为任意数'
        else:
            return -c / b
    else:
        d = (b * b) / (4 * a * a) - c / a
        if d < 0:
            return '无实数解'
        else:
            x1 = math.sqrt(d) - (b / 2 / a)
            x2 = -math.sqrt(d) - (b / 2 / a)
            return (x1, x2)

a = float(input('a:'))
b = float(input('b:'))
c = float(input('c:'))

print(quadratic(a, b, c))
