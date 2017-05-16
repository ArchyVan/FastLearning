import requests,sys,re,asyncio
from aiomysql import create_pool
import threading
 
header = {
	'User-Agent':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36',
}

target_url = "http://www.biquge.com.tw/xuanhuan/"
html = requests.get(url=target_url, headers=header)
html.encoding='gbk'
titlePattern = re.compile(r's2.*?"_blank">(.*?)</a>',re.S)
urlPattern = re.compile(r's2.*?《*.?href="(.*?)" target',re.S)
titles = re.findall(titlePattern, html.text)
urls = re.findall(urlPattern, html.text)

books = dict(zip(titles,urls))

class Book:
	def __init__(self,name,url,intro,chapters):
		self.name = name
		self.url = url
		self.intro = intro
		self.chapters = chapters
	
	def __str__(self):
		return '\nBookName:%s\nBookUrl:%s\nBookIntro:%s\nBookChapters:%s\n' % (self.name,self.url,self.intro,self.chapters)

	__repr__ = __str__
	
	
newBooks = []

lock = threading.Lock()
	
def detail(url,name):
	bookDetail = requests.get(url=url,headers=header)
	bookDetail.encoding='gbk'
	introPattern = re.compile(r'intro.*?p>(.*?)</p>',re.S)
	intro = re.findall(introPattern, bookDetail.text)[0]
	chapterPattern = re.compile(r'dd.*?/.*?/([0-9]+\.html?)">.*?</dd>',re.S)
	chapters = re.findall(chapterPattern, bookDetail.text)
	book = Book(name, url, intro,chapters)
	lock.acquire()
	newBooks.append(book)
	lock.release()
	

threadpool = []

for name, url in books.items():
	t = threading.Thread(target=detail, args=(url,name))
	threadpool.append(t)

for t in threadpool:
	t.start()

for t in threadpool:
	t.join()


print(newBooks)
#def contentDetail(url):
#	content = requests.get(url=url,headers=header)
#	print('thread %s is running...' % threading.current_thread().name)
#
#for book in newBooks:
#	for chapter in book.chapters:
#		curl = book.url + chapter
#		t = threading.Thread(target=contentDetail,args=(url,))
#		t.start()