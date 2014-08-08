class ScraperController < ApplicationController

def index
	scrap
end

def scrap
	   
	page = Nokogiri::HTML(open("http://quizlet.com/47571/barrons-gre-wordlist-4759-words-flash-cards/original"))   

	words = page.search('.term')

	Definition.delete_all
	
	i = 0
	words.each do |w|
		puts i
		word = w.search('.qWord')
		definition = w.search('.qDef')
	
		d = Definition.new
		d.word = word.first.content
		d.definition = definition.first.content
		d.save
		i += 1
	end
	
	
end


end
