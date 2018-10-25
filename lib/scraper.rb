require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = Nokogiri::HTML(open(index_url)).css("div.student-card")
    students.map { |student| parse_student_card(student) }
  end

  def self.parse_student_card(student)
    { name: student.css("h4.student-name").text,
      location: student.css("p.student-location").text,
      profile_url: student.css("a").first["href"]
    }
  end

  def self.scrape_profile_page(profile_url)
    profile = Nokogiri::HTML(open(profile_url))
    socials = profile.css("div.social-icon-container > a")
    { twitter: socials[0].first["href"],
      linkedin: socials[1].first["href"],
      github: socials[2].first["href"],
      blog: "",
      profile_quote: profile.css("div.profile-quote").text,
      bio: profile.css("div.description-holder > p").text
    }
  end
end
