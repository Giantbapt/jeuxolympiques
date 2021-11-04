require 'nokogiri'
require 'open-uri'

require_relative '../models/edition'

class TestScraperService

  def scrape
    jon = Athlete.new(name: "Céline")
    jon.save
    puts "#{jon.name} is saved !"
  end

end

# scrape = TestScraper.new

# scrape.scrape_test_edition

# jon = Athlete.new(name: "Céline")
# jon.save!

# puts "#{jon.name} is saved !"

# jony = Edition.new(name: "Céline")
# jony.save!

# puts "#{jony.name} edition is saved !"
