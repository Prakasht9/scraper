require 'nokogiri'
require 'httparty'
require 'pry'


def scraper 
  url = 'https://www.amazon.in/s?k=shoes&ref=nb_sb_noss_2'
  upscripted_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(upscripted_page)


  images = parsed_page.xpath('//img').map do |img|
    # puts "Header: #{img.xpath('preceding::h2[1]').text}"
    puts "  Image: #{img['src']}"
    img['src']
  end
  images
end

scraper