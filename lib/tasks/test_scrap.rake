require_relative '../../app/services/test_scraper_service'

namespace :scraper do
  desc "scrape jogging plus"
  task test_scrap: :environment do
    TestScraperService.new.scrape
  end
end
