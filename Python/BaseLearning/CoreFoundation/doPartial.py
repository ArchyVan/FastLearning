int('12345')
int('12345',16)
def int2(x, base = 2):
    return int(x, base)

int2('100000')
int2 = functools.partial(int, base=2)
int2('10010')

max2 = functools.partial(max, 10)
max2(5,6,7)
