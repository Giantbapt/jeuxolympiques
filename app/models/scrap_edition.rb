require 'nokogiri'
require 'open-uri'
require 'pry'
require 'watir'
# require 'selenium-webdriver'

#require_relative 'user'

class EditionScraper

  def scrape_editions
    #base_url = "https://olympics.com/fr/olympic-games"
    #base_url = "jo.html"

    browser = Watir::Browser.new
    browser.goto('https://olympics.com/fr/olympic-games')

    userName = browser.button(xpath: '//*[@id="olympic-all-games"]/section/div[1]/div/button')
    10.times { browser.execute_script("arguments[0].click();", userName) }



    #doc = Nokogiri::HTML.parse(base_url)
   doc = Nokogiri::HTML.parse(browser.html)

    scraped_editions = doc.css('#olympic-all-games').css('.liqtfK').css('[data-cy="next-link"]')
    editions = []


    scraped_editions.each do |edition|
      editions << edition.children.children.children.children[0]
    end
   puts editions
   #Athlete.new(name: "jon")
   #binding.pry
  end
end

scrape = EditionScraper.new

#scrape.scrape_editions
binding.pry
scrape.scrape_editions.crawl!

