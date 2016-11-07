print(ord('A'))
print(ord('中'))
print(chr(66))
print(chr(25991))
print('\u4e2d\u6587')
print('ABC.encode(\'ascii\') = ','ABC'.encode('ascii'))
print('中文.encode(\'utf-8\') = ','中文'.encode('utf-8'))
print('中文 length:',len('中文'))
print('ABC length:',len('ABC'))
'Hello, %s' % 'world'
'Hi, %s,you have $%d.' % ('Michael',1000000)
# %d	整数
# %f	浮点数
# %s	字符串
# %x	十六进制整数
'%2d-%02d' % (3, 1)
'%.2f' % 3.1415926
'Age: %s. Gender: %s' % (25, True)
'growth rate: %d %%' % 7
