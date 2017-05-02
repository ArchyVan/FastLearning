from datetime import datetime
now = datetime.now()
print(now)
print(type(now))
dt = datetime(2015,4,19,12,20)
print(dt)
print(dt.timestamp())
t = 1429417200.0
print(datetime.fromtimestamp(t))
cday = datetime.strptime('2015-6-1 18:19:59', '%Y-%m-%d %H:%M:%S')
print(cday)
print(cday.strftime('%a, %b %d %H:%M'))
now = datetime.now()
now
# datetime.datetime(2015, 5, 18, 16, 57, 3, 540997)
now + timedelta(hours=10)
# datetime.datetime(2015, 5, 19, 2, 57, 3, 540997)
now - timedelta(days=1)
# datetime.datetime(2015, 5, 17, 16, 57, 3, 540997)
now + timedelta(days=2, hours=12)
# datetime.datetime(2015, 5, 21, 4, 57, 3, 540997)
utc_dt = datetime.utcnow().replace(tzinfo=timezone.utc)
print(utc_dt)
# 2015-05-18 09:05:12.377316+00:00
# astimezone()将转换时区为北京时间:
bj_dt = utc_dt.astimezone(timezone(timedelta(hours=8)))
print(bj_dt)
# 2015-05-18 17:05:12.377316+08:00
# astimezone()将转换时区为东京时间:
tokyo_dt = utc_dt.astimezone(timezone(timedelta(hours=9)))
print(tokyo_dt)
# 2015-05-18 18:05:12.377316+09:00
# astimezone()将bj_dt转换时区为东京时间:
tokyo_dt2 = bj_dt.astimezone(timezone(timedelta(hours=9)))
print(tokyo_dt2)
# 2015-05-18 18:05:12.377316+09:00
def to_timestamp(dt_str, tz_str):
    dt = datetime.strptime(dt_str, '%Y-%m-%d %H:%M:%S')
    re_match = re.match(r'^UTC([\+-])(\d+):(\d+)$', tz_str)
    H, M = int(re_match.group(2)), int(re_match.group(3))
    if re_match.group(1) == '-':
        H = -H
        M = -M
    tz = timezone(timedelta(hours=H, minutes=M))
    dt = dt.replace(tzinfo=tz)
    return dt.timestamp()
