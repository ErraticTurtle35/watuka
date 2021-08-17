require_relative 'wakuta_configuration_reader'
require "selenium-webdriver"

CHROME_WEBDRIVER_KEY = 'chrome'
FIREFOX_WEBDRIVER_KEY = 'firefox'
WAKUTA_CONFIGURATION_FILE = '/wakuta_configuration.json'

class WakutaSeleniumDriverFactory
  def initialize
    configuration_reader = WakutaConfigurationReader.new(File.dirname(__FILE__), WAKUTA_CONFIGURATION_FILE)
    @configuration = configuration_reader.read_configuration
  end

  def browser_selected
    @configuration['driver']['browser']
  end

  def webdriver_instance
    case self.browser_selected
    when CHROME_WEBDRIVER_KEY
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--ignore-certificate-errors')
      options.add_argument('--disable-popup-blocking')
      options.add_argument('--disable-translate')
      options.add_argument('--chromever=92.0.4515.131')
      Selenium::WebDriver.for :chrome, options: options
    when FIREFOX_WEBDRIVER_KEY
      Selenium::WebDriver.for :firefox
    else
      puts 'upss' # TODO: CATCH EXCEPTION
      # type code here
    end
  end
end
