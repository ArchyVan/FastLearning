def fact(n):
    return fact_iter(n, 1)

def fact_iter(num, product):
    if num == 1:
        return product
    return fact_iter(num - 1, num * product)


def HanoiTower(n,source,Buffer,destination):
    if n == 1:
        print(source,'------>',destination)
        return
    HanoiTower(n-1,source,destination,Buffer)
    HanoiTower(1,source,Buffer,destination)
    HanoiTower(n-1,Buffer,source,destination)

HanoiTower(4,'A','B','C')
