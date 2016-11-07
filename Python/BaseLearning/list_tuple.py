classmates = ['Michael','Bob','Tracy']
print(classmates,' count:',len(classmates))
print('classmates[0]:',classmates[0])
print('classmates[1]:',classmates[1])
print('classmates[2]:',classmates[2])
# print('classmates[3]:',classmates[3])
print('classmates[-1]:',classmates[-1])
print('classmates[-2]:',classmates[-2])
# print('classmates[-4]:',classmates[0])

classmates.append('Adam')
print('classmates append Adam:',classmates)
classmates.pop()
print('classmates pop:',classmates)
classmates.pop(1)
print('classmates pop item at index 1:',classmates)
classmates[1] = 'Sarah'
print('classmates first item change:',classmates)

L = ['Apple',123,True]
s = ['python','java',['asp','php'],'scheme']
len(s)
p = ['asp','php']

t = ('a','b',['A','B'])
print('Tuple L:',L,'s:',s,'p:',p)
