# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html

__author__ = 'zhouquan'
from  scrapy.exceptions import DropItem
class DuplicateItemPipeline(object):
    def __init__(self):
        self.url_seen = set()

    def process_item(self,item,spider):
        if item['url'] in self.url_seen:
           raise DropItem("Missing price in %s" % item)

        else:
            self.url_seen.add(item['url'])
            return item