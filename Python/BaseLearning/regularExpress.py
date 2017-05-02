\d 数字
\w 字母或数字

00\d  007
\d\d\d 010
\w\w\d py3

. 任意字符
py. pyc pyo py!

\d{3}\s+\d{3,8}
[a-zA-Z\_][0-9a-zA-Z\_]{0, 19}

s = 'ABC\\-001'
s = r'ABC\-001'

import re

re.match(r'^\d{3}\-\d{3,8}$', '010-12345')

test = '用户输入的字符串'
if re.match(r'正则表达式', test):
    print('ok')
else:
    print('failed')
