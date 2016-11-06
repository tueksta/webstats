require './statproviders'
require 'parallel'

#The User is the authority for all user specific profile IDs and listnames
class User

  def initialize (name:, statsources: {})
    @name = name
    @statsources = statsources
    @import = Statproviders.instance
  end

  def stats (statprovider: statproviders)
    Parallel.each(statprovider) {
      |provider|
      count = @import.userstat(statprovider: provider, stat_url: stat_url(statprovider: provider))
      puts "#{count} on service #{provider}"
    }
  end

  def statproviders
    @statsources.keys
  end

private  
  def stat_url (statprovider:)
    @statsources[statprovider]
  end
end
