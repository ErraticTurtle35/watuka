require_relative '../utils/wakuta_selenium_driver_factory'
require "logger"

class BasePage
  def initialize(driver = nil)
    if driver
      @driver = driver
    else
      wakuta_selenium_driver = WakutaSeleniumDriverFactory.new
      webdriver_instance = wakuta_selenium_driver.webdriver_instance
      @driver = webdriver_instance
    end
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::INFO
  end

  def navigate_to(url)
    @driver.navigate.to url
  end

  def get_element(locator, locator_type = "Xpath")
    begin
      element_type = get_available_type_elements(locator_type)
      return @driver.find_element(element_type, locator)
    rescue
      raise NotImplementedError
    ensure
      @logger.debug("get_element: %{locator} %{locator_type}" % { locator: locator, locator_type: locator_type })
    end
  end

  def get_elements(locator, locator_type)
    begin
      element_type = get_available_type_elements(locator_type)
      return @driver.find_elements(element_type, locator)
    rescue
      raise NotImplementedError
    ensure
      @logger.debug("get_elements: %{locator} %{locator_type}" % { locator: locator, locator_type: locator_type })
    end
  end

  def get_child_element(element, locator, locator_type)
    begin
      element_type = get_available_type_elements(locator_type)
      return element.find_element(element_type, locator)
    rescue
      raise NotImplementedError
    ensure
      @logger.debug("get_child_element: %{locator} %{locator_type}" % { locator: locator, locator_type: locator_type })
    end
  end

  def get_child_elements(element, locator, locator_type)
    begin
      element_type = get_available_type_elements(locator_type)
      return element.find_elements(element_type, locator)
    rescue
      raise NotImplementedError
    ensure
      @logger.debug("get_child_elements: %{locator} %{locator_type}" % { locator: locator, locator_type: locator_type })
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
      raise NotImplementedError
    end
  end

  def driver
    @driver
  end

  def quit_driver
    @driver.quit
  end
end