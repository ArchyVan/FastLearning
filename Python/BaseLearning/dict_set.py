names = ['Michael','Bob','Tracy']
scores = [95,75,85]

d = {'Michael':95,'Bob':75,'Tracy':85}
print(d['Michael'])
d['Adam'] = 67
print(d)

d['Jack'] = 90
print('Thomas' in d)

d.get('Thomas')
d.get('Thomas',-1)

d.pop('Bob')
print(d)

# key = [1,2,3]
# d[key] = ' a list '

s = set([1,2,3])
print(s)

s = set([1,1,2,2,3,3])
print(s)
