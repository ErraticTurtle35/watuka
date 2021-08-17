require_relative '../utils/wakuta_selenium_driver_factory'

class BasePage
  def initialize
    wakuta_selenium_driver = WakutaSeleniumDriverFactory.new
    webdriver_instance = wakuta_selenium_driver.webdriver_instance
    @driver = webdriver_instance
    super
  end

  def navigate_to(url)
    @driver.navigate.to url
  end

  def get_element(locator, locator_type = "Xpath")
    begin
      element_type = get_available_type_elements(locator_type)
      return @driver.find_element(element_type, locator)
    rescue
      puts('A') # TODO: Clear the error messages
    ensure
      puts('A') # TODO: Clear the error messages
    end
  end

  def get_available_type_elements(element_type)
    case element_type
    when 'ClassName'
      :class
    when 'CssSelector'
      :css
    when 'Id'
      :id
    when 'LinkText'
      :link
    when 'Name'
      :name
    when 'PartialLinkText'
      :partial_link_text
    when 'TagName'
      :tag_name
    when 'Xpath'
      :xpath
    else
      puts('AAA') # TODO: Catch exception
    end
  end

end