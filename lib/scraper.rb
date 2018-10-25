require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)

    students = [Nokogiri::HTML(open(index_url)).css("div.student-card").first]
    students = student_cards.map { |student| parse_student_card(student) }
    students.map { |student| Student.new(student) }
  end

  def parse_student_card(student_card)
    binding.pry
  end

  def parse
  def self.scrape_profile_page(profile_url)

  end

end
