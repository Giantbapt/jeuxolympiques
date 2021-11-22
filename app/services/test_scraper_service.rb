require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../models/edition'
require_relative '../models/athlete'

class TestScraperService

  def scrape

    browser = Watir::Browser.new
    browser.goto('https://olympics.com/en/search/athletes/')


    moreButton = browser.button(xpath: '//*[@id="react-root-element-4"]/div/div[2]/div/div/section/div[2]/button')

    1.times { browser.execute_script("arguments[0].click();", moreButton) }




    binding.pry

    while moreButton.located? == true

      browser.execute_script("arguments[0].click();", moreButton)

      doc = Nokogiri::HTML.parse(browser.html)
      scraped_athletes = doc.css('div.search-body').css('li.grid__item')


      scraped_athletes.each do |athlete|

        athlete_name = athlete.css('p.module-subtitle').children.text
        athlete_sports = athlete.css('p.text-note').children.text

        if Athlete.where(:name => athlete_name, :sport => athlete_sports).exists? == false
          ath = Athlete.new(name: athlete_name, sport: athlete_sports)
          ath.save

          puts "#{ath.name} saved!"
        end

      end
    end




    #     browser.execute_script("arguments[0].click();", moreButton)
    # #  moreButton.present?

    #     # Initialisation des variables
    #     athletes_names = []
    #     athletes_countries = []
    #     athletes_images_names = []
    #     athletes_sport = []
    #     sum = 0

    #     # I guess it should be a hash
    #     athletes_medals = []
    #     athletes_images_names = []

    #     # Création des instances d'Athlète

    #       scraped_athletes.each do |athlete|
    #         athlete_editions = []

    #         athlete_country = athlete.children.css('[data-cy="country"]').children.text
    #         athletes_countries <<    athlete_country

    #         athlete_name = athlete.children.css('[data-cy="athlete-name"]').children.text
    #         athletes_names << athlete_name

    #         sum += 1


    #         # athletes_images_names << athlete.children.css('[data-cy="athlete-image-name"]').css('[alt="caeleb dressel"]').first.attributes.values[-1].value

    #         athlete_sport = athlete.children.css('[data-cy="sport"]').children.text
    #         athletes_sport << athlete_sport

    #         athlete_gold_medals = athlete.children.css('[title="Or"]').children.text.to_i
    #         athlete_silver_medals = athlete.children.css('[title="Silver"]').children.text.to_i
    #         athlete_bronze_medals = athlete.children.css('[title="Bronze"]').children.text.to_i
    #         number_of_medals =  athlete_gold_medals + athlete_silver_medals + athlete_bronze_medals

    #         athlete_medals = []
    #         athlete_medals << athlete_gold_medals
    #         athlete_medals << athlete_silver_medals
    #         athlete_medals << athlete_bronze_medals
    #         athletes_medals = athlete_medals

    #         athlete_edition = edition
    #         athlete_editions << athlete_edition

    #         if Athlete.where(name: athlete_name).exists? == false

    #           ath = Athlete.new(name: athlete_name, nationality: athlete_country, sport: athlete_sport, editions: athlete_editions, number_of_medals: number_of_medals, gold: athlete_gold_medals, silver: athlete_silver_medals, bronze: athlete_bronze_medals, number: sum)
    #           ath.save
    #            puts "#{ath.name} saved!"
    #         end
    #       end
      #end
  end

end
