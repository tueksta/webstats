require './statproviders'
require 'parallel'

#The User is the authority for all user specific profile IDs and listnames
class User

  def initialize (name:, statsources: {})
    @name = name
    @statsources = statsources
    @import = Statproviders.instance
  end

  def stat (statprovider:)
    count = @import.userstat(statprovider: statprovider, statprovider_url: statprovider_url(statprovider: statprovider))
    puts "#{count} on service #{statprovider}"
  end

  def stats ()
    Parallel.each(all_sources) { |provider| stat(statprovider: provider) }
  end

private  
  def statprovider_url (statprovider:)
    @statsources[statprovider]
  end

  def all_sources ()
    @statsources.keys
  end

end
