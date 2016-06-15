# -*- coding: utf-8 -*-
import scrapy

class Province:
    '省model'
    province_name = ""
    cities = []

class City:
    '城市model'
    city_name = ""
    areas = []

class Area:
    '地区model'
    area_name = ""



class WeatherSpider(scrapy.Spider):
    name = "weather"
    allowed_domains = ["www.weather.com.cn"]
    start_urls = (
        'http://www.weather.com.cn/textFC/hb.shtml',
    )

    url_has_seen = set()
    def parse(self, response):
        if response.status == 200:
             for x in response.css(".lqcontentBoxheader").xpath("./ul").xpath("./li").xpath('./a'):
                url = x.xpath('@href').extract()
                if url[0] not in self.url_has_seen:
                    self.url_has_seen.add(url[0])
                    yield scrapy.Request(response.urljoin(url[0]),callback=self.parse_province)
                 # yield {
                     # 'url':x.xpath("@href").extract(),
                     # 'province':x.xpath("text()").extract()

                 # }
                # 'url':response.css(".lqcontentBoxheader").xpath("./ul").xpath("./li").xpath("./a/@href").extract(),
                # 'provice':response.css(".lqcontentBoxheader").xpath("./ul").xpath("./li").xpath("./a//text()").extract()


    def parse_province(self,response):
        city = response.xpath('//title/text()').extract()[0]
        for x in response.css(".last").xpath("./a/@href").extract():
            if x not in self.url_has_seen:
                self.url_has_seen.add(x)
                yield {
                   "city":city,
                    'detail':x
                }

