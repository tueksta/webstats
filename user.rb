require './importer'
require 'parallel'

#The User is the authority for all user specific profile IDs and listnames
class User

  def initialize (name:, source_urls: {})
    @name = name
    @source_urls = source_ids
    @import = Importer.instance
  end

  def one_stat (sourcename:)
    count = @import.source_stat(user_url: source_url(sourcename: sourcename))
    puts "#{count} on service #{sourcename}"
  end

  def all_stats ()
    Parallel.each(all_sources) { |source| one_stat(sourcename: source) }
  end

private  
  def source_url (sourcename:)
    @source_urls[sourcename]
  end

  def all_sources ()
    @source_urls.keys
  end

end
