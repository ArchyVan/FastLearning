import os
print(os.name)
#print(os,uname())
print(os.environ)
print(os.environ.get('PATH'))
print(os.environ.get('x','default'))

print(os.path.abspath('.'))
print(os.path.join('/Users/ios/Desktop','testdir'))
#os.mkdir('/Users/ios/Desktop/testdir')
os.rmdir('/Users/ios/Desktop/testdir')
os.path.split('/Users/michael/testdir/file.txt')
#('/Users/michael/testdir', 'file.txt')
os.path.splitext('/path/to/file.txt')
#('/path/to/file', '.txt')
os.rename('test.txt', 'test.py')
os.remove('test.py')
 [x for x in os.listdir('.') if os.path.isdir(x)]
 [x for x in os.listdir('.') if os.path.isfile(x) and os.path.splitext(x)[1]=='.py']
