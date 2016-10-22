require './importer'
require 'parallel'

#The User is the authority for all user specific profile IDs and listnames
class User

  def initialize (name:, source_ids: nil)
    @name = name
    @source_ids = source_ids
    @import = Importer.instance
  end

  def get_one_stat (sourcename:)
    count = @import.get_source_stat(import_source: sourcename, user_id: sourcespecific_id(sourcename: sourcename))
    puts "#{count} on service #{sourcename}"
  end

  def get_all_stats ()
    Parallel.each(all_sources) { |sourcename| get_one_stat(sourcename: sourcename) }
  end

private  
  def sourcespecific_id (sourcename:)
    @source_ids[sourcename]
  end

  def all_sources ()
    @source_ids.keys
  end

end
