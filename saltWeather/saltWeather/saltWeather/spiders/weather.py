# -*- coding: utf-8 -*-
import scrapy
import re

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
        url=response.url
        wl = response.xpath('//div[@id="7d"]')
        summary = wl.xpath('./input/@value').extract()[0]
        livetime = wl.xpath('./input/@value').extract()[2]

        s7days = wl.xpath('./ul[@class="t clearfix"]').xpath('./li')
        s7daysweather = []
        for li in s7days:
            res = self.parseOneDay(li)
            s7daysweather.append(res)

        regex = ur"(\d+)/(\d+)"
        match = re.search(regex,summary)
        if match:
            low = match.group(1)
            high = match.group(2)
        yield {
            'province':province,
            'city':city,
            'area':area,
            'livetime':livetime,
            "weather":s7daysweather
        }

    def parseOneDay(self,node):
        day = node.xpath('./h1/text()').extract()
        we = node.xpath('./p[@class="wea"]//text()').extract()
        tem = node.xpath('./p[@class="tem"]')
        low = tem.xpath('./span//text()').extract()
        high = tem.xpath('./i//text()').extract()
        win = node.xpath('./p[@class="win"]')
        windes = win.xpath('./i//text()').extract()
        windir = win.xpath('./em')
        winddirs = []
        for winsp in windir.xpath('./span/@title'):
            winddirs.append(winsp.extract())

        return {"day":day,"weather":we,"low":low,"high":high,"wind":{"des":windes,"direction":winddirs}}
