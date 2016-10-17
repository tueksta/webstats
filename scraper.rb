require './user'
require './importsource'

#seed sources
@sources = {
            :goodreads => ImportSource.new('https://www.goodreads.com/review/list/', '?shelf=read',                                        ->(arg) { arg.css('.h1Shelf span')[0].text[1..-2] }),
            :imdb      => ImportSource.new('http://www.imdb.com/list/',              '?start=1&view=compact&sort=created:desc&defaults=1', ->(arg) { arg.css('#main .article .header .nav .desc')[0]['data-size'] }),
            :tvmaze    => ImportSource.new('http://www.tvmaze.com/users/',           '/stats',                                             ->(arg) { arg.css('section#activity ul li span')[0].text }),
            :grouvee   => ImportSource.new('https://www.grouvee.com/user/',          '',                                                   ->(arg) { arg.css('.sidebar-nav ul li a')[2].text[8..-2]}),
           }

#seed me as testuser
sourceIDs = {
              :goodreads => '373582-andreas',
              :imdb      => 'ls007361121',
              :tvmaze     => '32308/tuexss',
              :grouvee   => 'tuexss/shelves/88870-played/',
            }
andreas = User.new(name: 'Andreas', sourceIDs: sourceIDs)


#scrape it
def showCounter (source:, userID:)
  puts source
  puts @sources[source].countForUser(userID: userID)
end

andreas.listSources.each { |source| showCounter(source: source, userID: andreas.sourceToID(source: source)) }
