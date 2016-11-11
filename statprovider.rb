require 'Oga'
require 'net/http'

#Statprovider retrieves the stat from the statprovider parsed and formatted
class Statprovider
  VALUEPATTERN = /\d*,?\d+/

  def initialize (name:, cssselector: '', cssposition: 0)
    @name = name
    @cssselector = cssselector
    @cssposition = cssposition
  end

  def extractstat (url: '')
    formattedstat(url)
  end

  private

  def domelement (url)
    Oga.parse_html(Net::HTTP.get(url)).css(@cssselector)[@cssposition]
  end

  def formattedstat (url)
    domelement(url).text.scan(VALUEPATTERN).first
  end

end

class NullStatprovider < Statprovider

  def extractstat (url: '')
    'no stat found'
  end
end