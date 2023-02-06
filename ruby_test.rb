require 'rubygems'
require 'mechanize'
require 'json'

browser = Mechanize.new {|agent|
  agent.user_agent_alias = 'Mac Safari'
}

page = browser.get("https://agriculture.house.gov/news/documentsingle.aspx?DocumentID=2106")
title = page.xpath("//h2[@class='newsie-titler']/text()")
date_location = page.xpath("//div[@class='topnewstext']/b").text.split(',')
location = date_location.first.strip
date = DateTime.parse(date_location[2..-1].join).strftime('%m-&d-&Y')
article = page.xpath("//div[@class='main-newscopy']").text

result = {
  :title => title,
  :date => date,
  :location => location,
  :article => article
}

json_result = JSON[result]

puts json_result
