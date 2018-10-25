require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)

    students = [Nokogiri::HTML(open(index_url)).css("div.student-card").first]
    students = students.map { |student| parse_student_card(student) }
    binding.pry
    students.map { |student| Student.new(student) }
  end

  def self.parse_student_card(student)
    {
      name: student.css("h4.student-name").text,
      location: student.css("p.student-location").text,
      profile_url: student.css("a").first
    }
  end

  def self.scrape_profile_page(profile_url)

  end

end
