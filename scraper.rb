require 'nokogiri'
require 'httparty'
require 'pry'


def scraper 
  url = 'https://www.amazon.in/s?k=shoes&ref=nb_sb_noss_2'
  upscripted_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(upscripted_page)


  images = parsed_page.xpath('//img').map do |img|
    puts "  Image: #{img['src']}"
    img['src']
  end
  images

  # images_count = x
  # if images.length == x
  #   puts "Length pass"
  # end

  # image_x = some_image
  # if images.include?(some_image)
  #   puts "Pass Existance"
  # end
  
end

scraper