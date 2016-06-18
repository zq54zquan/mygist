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
                yield scrapy.Request(response.urljoin(x),callback=self.parse_city)


    def parse_city(self,response):
        cl = response.xpath('//div[@class="crumbs fl"]')
        areas = cl.xpath("./span//text()").extract()
        area = areas[len(areas)-1];
        citys = cl.xpath('./a//text()').extract()
        province = citys[0]
        city = citys[len(citys)-1]

        wl = response.xpath('//div[@id="today"]')
        wt = wl.xpath('./div[@class="t"]')
        wsk = wt.xpath('./div[@class="sk"]')
        wlimt = wsk.xpath('./div[@class="zs limit"]').xpath('./em/text()').extract()
        wtime = wsk.xpath('./div[@class="time"]').xpath('./span/text()').extract()
        wwet = wsk.xpath('./div[@class="zs h"]').xpath('./em/text()').extract()
        wwinds = wsk.xpath('./div[@class="zs w"]').xpath('./em/text()').extract()
        wwindd = wsk.xpath('./div[@class="zs w"]').xpath('./span/text()').extract()
        wtem = wsk.xpath('./div[@class="tem"]').xpath('./span/text()').extract()
        wair = wsk.xpath('./div[@class="zs pol"]').xpath('./span/.a/text()').extract()
        wairurl = wsk.xpath('./div[@class="zs pol"]').xpath('./span/.a/@href').extract()
        yield {
            "province":province,
            "city":city,
            "area":area,
            "livetime":wtime,
            "limit":wlimt,
            "wet":wwet,
            "winssize":wwinds,
            "winddirection":wwindd,
            "temp":wtem,
            "air":wair,
        }
