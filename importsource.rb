require 'HTTParty'
require 'Oga'

#Each importer knows where to get the data for a certain service and delivers data that has been asked for
class ImportSource

  def initialize (pattern)
    @pattern = pattern
  end

  def get_stat (user_url:)
    sourcepage = HTTParty.get(user_url)
    parsedpage = Oga.parse_html(sourcepage)
    @pattern.call parsedpage
  end
end
