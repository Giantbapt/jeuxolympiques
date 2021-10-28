require 'kimurai'

class JobScraper < Kimurai::Base
  @name= 'eng_job_scraper'
  @start_urls = ["https://olympics.com/fr/olympic-games"]
  @engine = :selenium_chrome
  @editions = []

  def scrape_page
     doc = browser.current_response
     returned_editions = doc.css('.next-link')
      # returned_editions.css('div.jobsearch-SerpJobCard').each do |char_element|
  end

  def parse(response, url:, data: {})
    scrape_page
    @editions
  end
end

JobScraper.crawl!
