require 'HTTParty'
require 'Oga'

#Statprovider retrieves the stat from the statprovider and parses it
class Statprovider
  def initialize (name:, cssselector: '', cssposition: 0)
    @name = name
    @cssselector = cssselector
    @cssposition = cssposition
  end

  def extractstat (url: '')
    html = HTTParty.get(url)
    dom  = Oga.parse_html(html)
    dom.css(@cssselector)[@cssposition].text.scan(/\d+/).first
  end
end
