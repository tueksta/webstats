require 'HTTParty'
require 'Oga'

#Each importer knows where to get the data for a certain service and delivers data that has been asked for
class ImportSource

  def initialize (url, parameters, pattern)
    @url = url
    @parameters = parameters
    @pattern = pattern
  end

  def url (user_id:)
    @url + user_id + @parameters
  end

  def get_stat (user_id:)
    sourcepage = HTTParty.get(url(user_id: user_id))
    parsedpage = Oga.parse_html(sourcepage)
    @pattern.call parsedpage
  end
end
