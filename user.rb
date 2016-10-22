require './importer'
require 'parallel'

#The User is the authority for all user specific profile IDs and listnames
class User

  def initialize (name:, sourceIDs:)
    @name = name
    @sourceIDs = sourceIDs
    @import = Importer.instance
  end

  def getStat (sourcename:)
    count = @import.counterStat(importSource: sourcename, userID: sourcespecificID(sourcename: sourcename))
    puts "#{count} on service #{sourcename}"
  end

  def getAllSourceStats ()
    Parallel.each(listSources) { |sourcename| getStat(sourcename: sourcename) }
  end

private  
  def sourcespecificID (sourcename:)
    @sourceIDs[sourcename]
  end

  def listSources ()
    @sourceIDs.keys
  end

end
