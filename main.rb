require "selenium-webdriver"

# options = Selenium::WebDriver::Chrome::Options.new
# options.add_argument('--ignore-certificate-errors')
# options.add_argument('--disable-popup-blocking')
# options.add_argument('--disable-translate')
# options.add_argument('--chromever=92.0.4515.131')
# driver = Selenium::WebDriver.for :chrome, options: options

# driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"

element = driver.find_element(name: 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

driver.quit

puts "HelloW"