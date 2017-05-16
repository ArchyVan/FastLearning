#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# Created on 2017-05-16 14:57:56
# Project: BiQuGe

from pyspider.libs.base_handler import *
import re
import pymongo

class Handler(BaseHandler):
	crawl_config = {
	}

	@every(minutes=24 * 60)
	def on_start(self):
		self.crawl('http://www.biquge.com.tw/xuanhuan/', callback=self.index_page)

	@config(age=10 * 24 * 60 * 60)
	def index_page(self, response):
		for each in response.doc('.l .s2 > a').items():
			self.crawl(each.attr.href,callback=self.book_page)

	@config(priority=2)
	def book_page(self, response):
		for each in response.doc('dd > a').items():
			self.crawl(each.attr.href,callback=self.chapter_page)
	
	@config(priority=3)
	def chapter_page(self, response):
		bidPattern = re.compile(r'index_page.*?/(.*?)/"',re.S)
		cidPattern = re.compile(r'chapter_id.*?"(.*?)"',re.S)
		cid = re.findall(cidPattern,response.text)[0]
		bid = re.findall(bidPattern,response.text)[0]
		title = response.doc('h1').text()
		content = response.doc('#content').text()
		return {
			"bid":bid,
			"cid":cid,
			"title":title,
			"content":content,
			"url":response.url
		}

	def on_result(self, result):
		if not result:
			return

		client = pymongo.MongoClient(host='127.0.0.1', port=27017)
		db = client['pyspyspider_projectdb']
		coll = db['website']

		data = {
			'bid': result['bid'],
			'cid': result['cid'],
			'title': result['title'],
			'content': result['content'],
			'url': result['url']
		}

		data_id = coll.insert(data)
		print (data_id)
