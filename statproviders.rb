require './statprovider'
require 'singleton'

#Statproviders retrieves the stat from the right statprovider
class Statproviders
	include Singleton

  def initialize ()
		@statproviders = {
      :goodreads    => Statprovider.new(name: 'goodreads',   cssselector: '.h1Shelf span'),
      :imdb         => Statprovider.new(name: 'imdb',        cssselector: '.list-meta'),
      :tvmaze       => Statprovider.new(name: 'tvmaze',      cssselector: 'section#activity ul li span'),
      :grouvee      => Statprovider.new(name: 'grouvee',     cssselector: '.sidebar-nav ul li a',                        cssposition: 2),
      :lastfm       => Statprovider.new(name: 'lastfm',      cssselector: 'tbody tr td a'),
      :strava       => Statprovider.new(name: 'strava',      cssselector: '.athlete-records div table tbody tr td',      cssposition: 7),
      :runkeeper    => Statprovider.new(name: 'runkeeper',   cssselector: 'div#statsSection div.statsItem div.statValue'),
      :openflights  => Statprovider.new(name: 'openflights', cssselector: '#stats'),
      :flightdiary  => Statprovider.new(name: 'flightdiary', cssselector: 'ul#profile-main-data li.first h2'),
		}
    @nullstatprovider = Statprovider.new(name: 'none')
  end

  def userstat (statprovider: @nullstatprovider, statprovider_url: '')
    provider = @statproviders[statprovider]
    provider.extractstat(url: statprovider_url)
  end

end