from enum import Enum, unique

Month = Enum('Month',('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'))

for name, member in Month.__members__.items():
    print(name,'=>',member,',',member.value)
# 默认从1开始计数

@unique
class Weekday(Enum):
    Sun = 0
    Mon = 1
    Tue = 2
    Wed = 3
    Thu = 4
    Fri = 5
    Sat = 6

day1 = Weekday.Mon
day2 = Weekday['Tue']
day3 = Weekday(3)
for name, member in Weekday.__members__.items():
    print(name, '=>', member)
