require 'Oga'
require 'net/http'

#Statprovider retrieves the stat from the statprovider parsed and formatted
class Statprovider
  @@valuepattern = /\d*,?\d+/
  def initialize (name:, cssselector: '', cssposition: 0)
    @name = name
    @cssselector = cssselector
    @cssposition = cssposition
  end

  def extractstat (url: '')
    formattedstat(url)
  end

  private
  def parsedhtml (url)
    Oga.parse_html(Net::HTTP.get(url))
  end

  def domelement (url)
    parsedhtml(url).css(@cssselector)[@cssposition]
  end

  def formattedstat (url)
    domelement(url).text.scan(@@valuepattern).first
  end

end
