require 'rubygems'
require 'mechanize'
require 'json'

browser = Mechanize.new {|agent|
  agent.user_agent_alias = 'Mac Safari'
}

page = browser.get("https://agriculture.house.gov/news/documentsingle.aspx?DocumentID=2106")
title = page.xpath("//h2[@class='newsie-titler']/text()")
location_and_date = page.xpath("//div[@class='topnewstext']/b/text()").to_s
location = location_and_date.split(',').shift.strip
date = location_and_date.split(',')[2..-1].join
parsed_date = DateTime.parse(date).strftime('%m-%d-%Y')
article = page.xpath("//div[@class='main-newscopy']").text

result = {
  :title => title,
  :date => parsed_date,
  :location => location,
  :article => article
}

json_result = JSON[result]

puts json_result
