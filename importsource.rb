require 'HTTParty'
require 'Oga'
require './user'

class ImportSource

  def initialize (url, parameters, pattern)
    @url = url
    @parameters = parameters
    @pattern = pattern
  end

  def urlBuilder (userID:)
    @url + userID + @parameters
  end

  def countForUserID (userID:)
    sourcepage = HTTParty.get(urlBuilder(userID: userID))
    parsedpage = Oga.parse_html(sourcepage)
    @pattern.call parsedpage
  end
end
