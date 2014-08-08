class ScraperController < ApplicationController

def index
	scrap
end

def scrap
	require 'open-uri'
     
	page = Nokogiri::HTML(open("http://andresiglesias.net/scraper/dictionary.html"))   

	words = page.search('.term')

	Definition.delete_all
	
	words.each do |w|
		word = w.search('.word')
		definition = w.search('.definition')
	
		d = Definition.new
		d.word = word.first.content
		d.definition = definition.first.content
		d.save
	end
	
	
end


end
