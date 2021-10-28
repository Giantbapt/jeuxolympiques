require 'nokogiri'
require 'open-uri'
require 'pry'

require 'watir'
require 'selenium-webdriver'



class Scraper
  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def scrape_athletes
  base_url = "sydney_olympics.html"

  html = open(base_url)

  doc = Nokogiri::HTML(html)

  athletes = doc.css('[data-cy= "athlete-row"]')
  # athletes = doc.search('.styles__AthleteRow-sc-1cwgvzp-0')
  binding.pry
  end

  def scrape_athletes_watir
    base_url = "https://olympics.com/fr/olympic-games/tokyo-2020/athletes"
    #base_url = "jo.html"

    browser = Watir::Browser.new
    browser.goto('https://olympics.com/fr/olympic-games/tokyo-2020/athletes')

    userName = browser.button(xpath: '//*[@id="__next"]/section/section[4]/section/div[2]/button')
    10.times { browser.execute_script("arguments[0].click();", userName) }



    doc = Nokogiri::HTML.parse(browser.html)

    scraped_athletes = doc.css('[data-cy="athlete-row"]')
    athletes_names = []

    scraped_athletes.each do |athlete|
      athletes_names << athlete.children.css('[data-cy="athlete-name"]').children.text
    end
    binding.pry
  end


  def scrape_editions
    base_url = "https://olympics.com/fr/olympic-games"
    #base_url = "jo.html"

    browser = Watir::Browser.new
    browser.goto('https://olympics.com/fr/olympic-games')

    userName = browser.button(xpath: '//*[@id="olympic-all-games"]/section/div[1]/div/button')
    10.times { browser.execute_script("arguments[0].click();", userName) }



    doc = Nokogiri::HTML.parse(browser.html)

    scraped_editions = doc.css('#olympic-all-games').css('.liqtfK').css('[data-cy="next-link"]')
    editions = []


    scraped_editions.each do |edition|
      editions << edition.children.children.children.children[0]
    end
    binding.pry
  end

  def scrape_watir
    browser = Watir::Browser.new
    browser.goto('https://olympics.com/fr/olympic-games')

    # base_url = "https://olympics.com/fr/olympic-games"
    # #base_url = "jo.html"
    # html = open(base_url)

    # doc = Nokogiri::HTML(html)

    userName = browser.button(xpath: '//*[@id="olympic-all-games"]/section/div[1]/div/button')
     browser.execute_script("arguments[0].click();", userName)

    results = browser.elements(id: '#olympic-all-games')
    results.each do |element|
      puts element.text.strip
    end
    #editions = browser.elements(id: '#olympic-all-games')
    #editions = browser.elements(css: '#olympic-all-games .liqtfK [data-cy="next-link"]')
    #results = browser.element(css: '#olympic-all-games .liqtfK [data-cy="next-link"]')
    # browser.execute_script('document.getElementByClassName("Buttonstyles__Button-sc-6knvau-0").click(); ')
    # puts browser.a('.styles__Link-sc-bsuj30-1').when_present.text

    # doc = Nokogiri::HTML.parse(browser.html)

    # puts browser.('Tokyo 2020').when_present.text

    #editions = doc.search('#olympic-all-games')
    # editions = doc.css('[data-cy="next-link"]')
    binding.pry
  end

    def scrape_watir2
      # browser = Watir::Browser.new
      # browser.goto('https://olympics.com/fr/olympic-games')

      base_url = "https://olympics.com/fr/olympic-games"
      #base_url = "jo.html"
      html = open(base_url)

      doc = Nokogiri::HTML(html)

      #userName = doc.button(xpath: '//*[@id="olympic-all-games"]/section/div[1]/div/button')
      userName = doc.css('[data-cy="more-button"]')
       @driver.execute_script(" return arguments[0].click();", userName)

      # results = browser.elements(id: '#olympic-all-games')
      # results.each do |element|
      #   puts element.text.strip
      # end
      #editions = browser.elements(id: '#olympic-all-games')
      #editions = browser.elements(css: '#olympic-all-games .liqtfK [data-cy="next-link"]')
      #results = browser.element(css: '#olympic-all-games .liqtfK [data-cy="next-link"]')
      # browser.execute_script('document.getElementByClassName("Buttonstyles__Button-sc-6knvau-0").click(); ')
      # puts browser.a('.styles__Link-sc-bsuj30-1').when_present.text

      # doc = Nokogiri::HTML.parse(browser.html)

      # puts browser.('Tokyo 2020').when_present.text

      editions = doc.search('#olympic-all-games')
      # editions = doc.css('[data-cy="next-link"]')
      binding.pry

    end
end

scrape = Scraper.new

#scrape.scrape_athletes
scrape.scrape_athletes_watir.crawl!
#scrape.scrape_editions.crawl!
#scrape.scrape_watir
#scrape.scrape_watir2.crawl!

