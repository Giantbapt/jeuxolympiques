require 'nokogiri'
require 'open-uri'
require 'pry'

require 'watir'
require 'selenium-webdriver'

require_relative '../models/edition'
require_relative '../models/athlete'



class AthletesScraperService

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def moreButtonsTimes(x)
    m
    x.times { browser.execute_script("arguments[0].click();", moreButton) }
  end


  def scrape

    # Participation.destroy_all
    # Athlete.destroy_all

    all_editions = Edition.all
    all_editions.each do |item|
      #base_url = "https://olympics.com/fr/olympic-games/tokyo-2020/athletes"
      browser = Watir::Browser.new
      #browser.goto('https://olympics.com/fr/olympic-games/tokyo-2020/athletes')
      #binding.pry
      #web_address = 'https://olympics.com/fr/olympic-games/athens-1896/athletes'
      web_address = 'https://olympics.com/fr/olympic-games/' + item.slug + '/athletes'
      browser.goto(web_address)
      #binding.pry
      moreButton = browser.button(xpath: '//*[@id="__next"]/section/section[4]/section/div[2]/button')



      1.times { browser.execute_script("arguments[0].click();", moreButton) }

      # until moreButton.present? == false
      #   moreButton.click
      # end
      love_count = 0

      while moreButton.located? == true
          puts "moreButton #{moreButton.located?}"
              # binding.pry
              # love_count += 1
          browser.execute_script("arguments[0].click();", moreButton)
          doc = Nokogiri::HTML.parse(browser.html)
      #  moreButton.present?
           scraped_athletes = doc.css('[data-cy="athlete-row"]')

          # Initialisation des variables
          athletes_names = []
          athletes_countries = []
          athletes_images_names = []
          athletes_sport = []
          sum = 0

          # Initialisation de la variable d'édition
          #binding.pry
          #edition = Edition.where(name: "Athènes 1896")[0]
          edition = Edition.where(name: item.name)[0]

          # I guess it should be a hash
          athletes_medals = []
          athletes_images_names = []

          # Création des instances d'Athlète

            scraped_athletes.each do |athlete|
              #athlete_editions = []

              athlete_country = athlete.children.css('[data-cy="country"]').children.text
              #athletes_countries <<    athlete_country

              athlete_name = athlete.children.css('[data-cy="athlete-name"]').children.text
              #athletes_names << athlete_name

              sum += 1


              # athletes_images_names << athlete.children.css('[data-cy="athlete-image-name"]').css('[alt="caeleb dressel"]').first.attributes.values[-1].value

              athlete_sport = athlete.children.css('[data-cy="sport"]').children.text
              #athletes_sport << athlete_sport

              athlete_gold_medals = athlete.children.css('[title="Or"]').children.text.to_i
              athlete_silver_medals = athlete.children.css('[title="Silver"]').children.text.to_i
              athlete_bronze_medals = athlete.children.css('[title="Bronze"]').children.text.to_i
              number_of_medals =  athlete_gold_medals + athlete_silver_medals + athlete_bronze_medals

              athlete_medals = []
              athlete_medals << athlete_gold_medals
              athlete_medals << athlete_silver_medals
              athlete_medals << athlete_bronze_medals
              athletes_medals = athlete_medals

              athl = Athlete.where(name: athlete_name, nationality: athlete_country)[0]

              if Athlete.where(name: athlete_name, nationality: athlete_country).exists? == false
                #binding.pry
                ath = Athlete.new(name: athlete_name, nationality: athlete_country)
                #binding.pry
                ath.save

                part = Participation.new(athlete: ath, edition: edition , sport: athlete_sport, number_of_medals: number_of_medals, gold: athlete_gold_medals, silver: athlete_silver_medals, bronze: athlete_bronze_medals)
                part.save

                ath.number_of_medals =+ part.number_of_medals
                ath.silver =+ part.silver
                ath.gold =+ part.gold
                ath.bronze =+ part.bronze
                ath.save


                 puts "#{ath.name} saved!"
              else
                if Participation.where(athlete: athl, edition: edition, sport: athlete_sport).exists? == false

                  part = Participation.new(athlete: athl, edition: edition , sport: athlete_sport, number_of_medals: number_of_medals, gold: athlete_gold_medals, silver: athlete_silver_medals, bronze: athlete_bronze_medals)
                  part.save
                    puts "Participation is saved"

                  athl.number_of_medals =+ part.number_of_medals
                  athl.silver =+ part.silver
                  athl.gold =+ part.gold
                  athl.bronze =+ part.bronze
                  athl.save
                end

              end
              #binding.pry

            end
          end

        end
     end
end



