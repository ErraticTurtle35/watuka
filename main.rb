require_relative 'utils/wakuta_selenium_driver_factory'
require_relative 'pages/base_page'

base_page = BasePage.new
base_page.navigate_to "http://google.com"

element = base_page.get_element('q', 'Name')
# element = base_page.driver.find_element(name: 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts base_page.driver.title

base_page.driver.quit

puts "HelloW"

# wakuta_selenium_driver = WakutaSeleniumDriverFactory.new
# driver = wakuta_selenium_driver.webdriver_instance
# driver.navigate.to "http://google.com"
#
# element = driver.find_element(name: 'q')
# element.send_keys "Hello WebDriver!"
# element.submit
#
# puts driver.title
#
# driver.quit
#
# puts "HelloW"