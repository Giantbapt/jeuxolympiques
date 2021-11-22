require_relative '../../app/services/test_scraper_service'

namespace :scraper do
  desc "scrape athletes"
  task athletes_scrap: :environment do
    AthletesScraperService.new.scrape
  end
end
