require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require './user'

class ImportSource
	def initialize(url, parameters, pattern)
		@url = url
		@parameters = parameters
		@pattern = pattern
	end

	def countForUser (userID:)
		sourcepage = HTTParty.get(@url + userID + @parameters)
		parsedpage = Nokogiri::HTML(sourcepage)
		@pattern.call parsedpage
	end
end
