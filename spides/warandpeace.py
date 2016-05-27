import sys
from bs4 import BeautifulSoup
import urllib2
reload(sys)
sys.setdefaultencoding( "utf-8")

request = urllib2.Request("http://www.pythonscraping.com/pages/warandpeace.html")
html = urllib2.urlopen(request)
bsObj = BeautifulSoup(html)
nameList = bsObj.findAll("span",{"class":"green"})
for name in nameList:
    print(name.get_text())

