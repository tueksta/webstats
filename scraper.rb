require './user'

#Seed me as testuser
statsources = {
                :goodreads   => URI('https://www.goodreads.com/review/list/373582-andreas?shelf=read'),
                :imdb        => URI('http://www.imdb.com/user/ur5674832/'),
                :tvmaze      => URI('http://www.tvmaze.com/users/32308/tuexss/stats'),
                :grouvee     => URI('https://www.grouvee.com/user/tuexss/shelves/88870-played/'),
                :lastfm      => URI('http://www.last.fm/user/Tueksta'),
                :strava      => URI('https://www.strava.com/athletes/15089803'),
                :runkeeper   => URI('https://runkeeper.com/user/Tueksta'),
                :flightdiary => URI('http://flightdiary.net/tuexss'),
#                :openflights => 'tuexss',
              }

andreas = User.new(name: 'Andreas', statsources: statsources)
andreas.stats
