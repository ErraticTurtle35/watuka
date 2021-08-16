require_relative '../utils/wakuta_selenium_driver_factory'

class BasePage
  def initialize
    wakuta_selenium_driver = WakutaSeleniumDriverFactory.new
    webdriver_instance = wakuta_selenium_driver.webdriver_instance
    @driver = webdriver_instance
    super
  end
end