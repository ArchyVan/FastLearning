import base64
base64.b64encode(b'binary\x00string')
# b'YmluYXJ5AHN0cmluZw=='
base64.b64decode(b'YmluYXJ5AHN0cmluZw==')
# b'binary\x00string'
base64.b64encode(b'i\xb7\x1d\xfb\xef\xff')
# b'abcd++//'
base64.urlsafe_b64encode(b'i\xb7\x1d\xfb\xef\xff')
# b'abcd--__'
base64.urlsafe_b64decode('abcd--__')
# b'i\xb7\x1d\xfb\xef\xff'
def safe_base64_decode(s):
    number_of_equal = len(s)%4
    if isinstance(s,bytes):
        code = s + b'='*number_of_equal
    elif isinstance(s,str):
        code = s + '='*number_of_equal
    return base64.urlsafe_b64decode(code)
