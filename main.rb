require_relative 'utils/wakuta_selenium_driver_factory'

wakuta_selenium_driver = WakutaSeleniumDriverFactory.new
driver = wakuta_selenium_driver.webdriver_instance
driver.navigate.to "http://google.com"

element = driver.find_element(name: 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

driver.quit

puts "HelloW"