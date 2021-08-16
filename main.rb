require_relative 'wakuta_selenium_driver'

wakuta_selenium_driver = WakutaSeleniumDriver.new
driver = wakuta_selenium_driver.webdriver_instance
driver.navigate.to "http://google.com"

element = driver.find_element(name: 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

driver.quit

puts "HelloW"