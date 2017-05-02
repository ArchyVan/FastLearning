n = 10240099
b1 = (n & 0xff000000) >> 24
b2 = (n & 0xff0000) >> 16
b3 = (n & 0xff00) >> 8
b4 = n & 0xff
bs = bytes([b1, b2, b3, b4])
bs

import struct
struct.pack('>I',10240099)
struct.unpack('>IH', b'\xf0\xf0\xf0\xf0\x80\x80')
