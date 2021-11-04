require_relative 'test_scrap.rb'

namespace :scraper do
  desc "scrape edition"
  task scrape_test: :environment do
    TestScraperService.new.scrape
  end
end
