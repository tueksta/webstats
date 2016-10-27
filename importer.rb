require 'singleton'
require 'HTTParty'
require 'Oga'

#Importer retrieves the stat from the right statprovider
class Importer
	include Singleton

  def initialize ()
		@statproviders = {
      :goodreads   => ->(arg) { arg.css('.h1Shelf span')[0].text.scan(/\d+/).first },
      :imdb        => ->(arg) { arg.css('#main .article .header .nav .desc')[0]['data-size'] },
      :tvmaze      => ->(arg) { arg.css('section#activity ul li span')[0].text },
      :grouvee     => ->(arg) { arg.css('.sidebar-nav ul li a')[2].text.scan(/\d+/).first },
      :lastfm      => ->(arg) { arg.css('tbody tr td a')[0].text },
      :strava      => ->(arg) { arg.css('.athlete-records div table tbody tr td')[7].text },
      :runkeeper   => ->(arg) { arg.css('div#statsSection div.statsItem div.statValue')[0].text.scan(/\d+/).first },
      :openflights => ->(arg) { arg.css('#stats')[0].text },
      :flightdiary => ->(arg) { arg.css('ul#profile-main-data li.first h2')[0].text.scan(/\d+/).first },
		}
  end

  def userstat (statprovider:, statprovider_url:)
    html = HTTParty.get(statprovider_url)
    parsed = Oga.parse_html(html)
    @statproviders[statprovider].call(parsed)
  end
end
