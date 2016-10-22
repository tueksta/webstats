require './user'

#Seed me as testuser
source_ids = {
              :goodreads   => '373582-andreas',
              :imdb        => 'ls007361121',
              :tvmaze      => '32308/tuexss',
              :grouvee     => 'tuexss/shelves/88870-played/',
              :lastfm      => 'Tueksta',
              :strava      => '15089803',
              :runkeeper   => 'Tueksta',
#              :openflights => 'tuexss',
              :flightdiary => 'tuexss',
            }

andreas = User.new(name: 'Andreas', source_ids: source_ids)

andreas.all_stats()
