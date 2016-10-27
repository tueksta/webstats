require './user'

#Seed me as testuser
statsources = {
                :goodreads   => 'https://www.goodreads.com/review/list/373582-andreas?shelf=read',
                :imdb        => 'http://www.imdb.com/list/ls007361121?start=1&view=compact&sort=created:desc&defaults=1',
                :tvmaze      => 'http://www.tvmaze.com/users/32308/tuexss/stats',
                :grouvee     => 'https://www.grouvee.com/user/tuexss/shelves/88870-played/',
                :lastfm      => 'http://www.last.fm/user/Tueksta',
                :strava      => 'https://www.strava.com/athletes/15089803',
                :runkeeper   => 'https://runkeeper.com/user/Tueksta',
                :flightdiary => 'http://flightdiary.net/tuexss',
#                :openflights => 'tuexss',
              }

andreas = User.new(name: 'Andreas', statsources: statsources)
andreas.all_stats()
