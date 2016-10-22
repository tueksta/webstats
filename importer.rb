require './importsource'
require 'singleton'

#Importer manages all the import sources and accepts import requests, finds the right source to do it, and hands back the import result
class Importer
	include Singleton

  def initialize ()
		@sources = {
:goodreads   => ImportSource.new('https://www.goodreads.com/review/list/', '?shelf=read',                                        ->(arg) { arg.css('.h1Shelf span')[0].text.scan(/\d+/).first }),
:imdb        => ImportSource.new('http://www.imdb.com/list/',              '?start=1&view=compact&sort=created:desc&defaults=1', ->(arg) { arg.css('#main .article .header .nav .desc')[0]['data-size'] }),
:tvmaze      => ImportSource.new('http://www.tvmaze.com/users/',           '/stats',                                             ->(arg) { arg.css('section#activity ul li span')[0].text }),
:grouvee     => ImportSource.new('https://www.grouvee.com/user/',          '',                                                   ->(arg) { arg.css('.sidebar-nav ul li a')[2].text.scan(/\d+/).first }),
:lastfm      => ImportSource.new('http://www.last.fm/user/',               '',                                                   ->(arg) { arg.css('tbody tr td a')[0].text }),
:strava      => ImportSource.new('https://www.strava.com/athletes/',       '',                                                   ->(arg) { arg.css('.athlete-records div table tbody tr td')[7].text }),
:runkeeper   => ImportSource.new('https://runkeeper.com/user/',            '/profile',                                           ->(arg) { arg.css('div#statsSection div.statsItem div.statValue')[0].text.scan(/\d+/).first }),
:openflights => ImportSource.new('http://openflights.org/user/',           '',                                                   ->(arg) { arg.css('#stats')[0].text }),
:flightdiary => ImportSource.new('http://flightdiary.net/',                '',                                                   ->(arg) { arg.css('ul#profile-main-data li.first h2')[0].text.scan(/\d+/).first }),
		}
  end

  def source_stat (user_id:, import_source:)
    @sources[import_source].get_stat(user_id: user_id)
  end
end
