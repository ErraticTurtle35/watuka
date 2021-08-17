require 'json'

class WakutaConfigurationReader
  def initialize(file_path, file_name)
    @absolute_path = file_path + file_name
  end

  def read_configuration
    wakuta_configuration = File.read(@absolute_path)
    JSON.parse(wakuta_configuration)
  end
end

