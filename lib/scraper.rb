require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = Nokogiri::HTML(open(index_url)).css("div.student-card")
  end

  def self.scrape_profile_page(profile_url)

  end

end
