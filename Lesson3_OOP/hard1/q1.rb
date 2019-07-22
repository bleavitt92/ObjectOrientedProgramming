class SecretFile
  # attr_reader :data remove this b/c need a more specific method defined

  def initialize(secret_data, logger) # modified to take a SecurityLogger object as an argument and assign it to an instance variable
    @data = secret_data
    @logger = logger
  end
  
  def data
    @logger.create_log_entry # from above, logger is a SecurityLogger object
    @data
  end
end

class SecurityLogger
  def create_log_entry
    puts "this is my entry"
    # ... implementation omitted ...
  end
end

data_things = SecurityLogger.new
SecretFile.new('secrets', data_things).data
