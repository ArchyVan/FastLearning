# def fact(n):
#     if n == 1:
#         return 1
#     return n * fact(n - 1)
#
# print(fact(5))

def fact(n):
    return fact_iter(n,1)

def fact_iter(num, product):
    if num == 1:
        return product
    return fact_iter(num - 1, num * product)

# print(fact_iter(5,1))

def move(n,a,b,c):
    w='The End'
    if n==1:
        print(a,'-->',c)
    else:
        move(n-1,a,c,b)
        print(a,'-->',c)
        move(n-1,b,a,c)
    return w
n=int(input('请输入汉诺塔的层数:'))
print(move(n,'起始柱','临时柱','目标柱'))
