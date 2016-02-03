require './web_scrapper'
require 'byebug'

url = 'www.google.com'
bot = WebScrapper.new(url)

puts bot.external_links
puts bot.internal_links
