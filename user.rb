require './importer'
require 'parallel'

class User

  def initialize (name:, sourceIDs:)
    @name = name
    @sourceIDs = sourceIDs
    @import = Importer.new
  end


  def sourcespecificID (sourcename:)
    @sourceIDs[sourcename]
  end

  def listSources ()
    @sourceIDs.keys
  end


  def getStat (sourcename:)
    count = @import.counterStat(importSource: sourcename, userID: sourcespecificID(sourcename: sourcename))
    puts "#{count} on service #{sourcename}"
  end

  def getAllSourceStats ()
    Parallel.each(listSources) { |sourcename| getStat(sourcename: sourcename) }
  end
end
