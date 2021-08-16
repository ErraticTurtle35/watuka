require 'json'

class WakutaConfigurationReader

  def initialize
    @absolute_path = File.absolute_path("wakuta_configuration.json")
    super
  end

  def read_configuration
    wakuta_configuration = File.read(@absolute_path)
    JSON.parse(wakuta_configuration)
  end

end

