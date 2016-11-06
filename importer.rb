require 'singleton'
require 'HTTParty'
require 'Oga'

#Importer retrieves the stat from the right statprovider
class Importer
	include Singleton

  def initialize ()
		@statproviders = {
      :goodreads   => ->(arg) { arg.css('.h1Shelf span')[0] },
      :imdb        => ->(arg) { arg.css('.list-meta')[0] },
      :tvmaze      => ->(arg) { arg.css('section#activity ul li span')[0] },
      :grouvee     => ->(arg) { arg.css('.sidebar-nav ul li a')[2] },
      :lastfm      => ->(arg) { arg.css('tbody tr td a')[0] },
      :strava      => ->(arg) { arg.css('.athlete-records div table tbody tr td')[7] },
      :runkeeper   => ->(arg) { arg.css('div#statsSection div.statsItem div.statValue')[0] },
      :openflights => ->(arg) { arg.css('#stats')[0] },
      :flightdiary => ->(arg) { arg.css('ul#profile-main-data li.first h2')[0] },
		}
  end

  def userstat (statprovider:, statprovider_url:)
    html = HTTParty.get(statprovider_url)
    parsed = Oga.parse_html(html)
    @statproviders[statprovider].call(parsed).text.scan(/\d+/).first
  end
end
