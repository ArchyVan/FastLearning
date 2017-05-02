f = open('/Users/ios/Desktop/FastLearning/Python/BaseLearning/OOP/classInstance.py','r')
f.read()
f.close()

try:
    f = open('/path/to/file', 'r')
    print(f.read())
finally:
    if f:
        f.close()

with open('/path/to/file','r')
    print(f.read())

for line in f.readlines():
    print(line.strip())

f = open('/Users/ios/test.jpg','rb')
f.read()

f = open('/Users/michael/gbk.txt', 'r', encoding='gbk')
f.read()

f = open('/Users/michael/gbk.txt', 'r', encoding='gbk', errors='ignore')

f = open('/Users/michael/test.txt', 'w')
f.write('Hello, world!')
f.close()

with open('/Users/michael/test.txt', 'w') as f:
    f.write('Hello, world!')
