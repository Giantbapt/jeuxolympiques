require 'nokogiri'
require 'open-uri'
require 'pry'
require 'watir'
# require 'selenium-webdriver'

#require_relative 'user'

class ScrapEditionService

  def scrape
    #base_url = "https://olympics.com/fr/olympic-games"
    #base_url = "jo.html"
    #Edition.destroy_all
    browser = Watir::Browser.new
    browser.goto('https://olympics.com/fr/olympic-games')

    userName = browser.button(xpath: '//*[@id="olympic-all-games"]/section/div[1]/div/button')
    9.times { browser.execute_script("arguments[0].click();", userName) }



    #doc = Nokogiri::HTML.parse(base_url)
   doc = Nokogiri::HTML.parse(browser.html)

    scraped_editions = doc.css('#olympic-all-games').css('.liqtfK').css('[data-cy="next-link"]')
    #editions = []
    sum = 0


    scraped_editions.each do |edition|

      edition_name = edition.children.children.children.children[0].children.text
      last = edition_name.split.last
      edition_place = edition_name.remove(last)
      edition_season = edition.children.children.children.children[1].children.text
      edition_year = edition_name.split.last
      #binding.pry
      edition_logo = edition.children.children.children.children[2].children.children.children.children.children.children.first.children.first.attributes['src'].value
      edition_slug = edition_name.downcase.parameterize

      #binding.pry
      # editions << edition_name
      new_edition = Edition.new(name: edition_name, place: edition_place, season: edition_season, year: edition_year, logo: edition_logo, slug: edition_slug)
      new_edition.save
    end
   #puts editions
   #Athlete.new(name: "jon")
   binding.pry
  end
end

# scrape = EditionScraper.new

# #scrape.scrape_editions
# binding.pry
# scrape.scrape_editions.crawl!

