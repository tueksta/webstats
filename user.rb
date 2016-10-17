class User

  def initialize (name:, sourceIDs: nil)
  	@name=name
  	@sourceIDs = sourceIDs
  end

  def listSources()
  	@sourceIDs.keys
  end

  def sourceToID(source:)
  	@sourceIDs[source]
  end
end
