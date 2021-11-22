require_relative '../../app/services/scrap_edition_service'

namespace :scraper do
  desc "scrape editions"
  task scrap_edition: :environment do
    ScrapEditionService.new.scrape
  end
end
