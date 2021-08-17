require_relative 'base_page'

class VisitorHomePage < BasePage
  def initialize
    @switch_search_source_button = '//*[@id="nav-main"]/div/div/form/div/button[@data-cy="search-switch-button"]'
    @freelancers_options = '//*[@id="nav-main"]/div/div[1]/form/div/ul/li[1]/a[@data-cy="menuitem-freelancers-button"]'
    @search_talent_input = '//*[@id="nav-main"]/div/div[1]/form/input[2]'
    @search_button = '//*[@id="nav-main"]/div/div[1]/form/div/button[2]'
    super
  end

  def switch_search_source_button
    @switch_search_source_button
  end

  def freelancers_options
    @freelancers_options
  end

  def search_talent_input
    @search_talent_input
  end

  def search_button
    @search_button
  end

  def click_search_source_button
    element = self.get_element(@switch_search_source_button, 'Xpath')
    element.click
  end

  def click_talent_option
    element = self.get_element(@freelancers_options, 'Xpath')
    element.click
  end

  def click_search_input(keywords)
    element = self.get_element(@search_talent_input, 'Xpath')
    element.send_keys keywords
  end

  def click_search_button
    element = self.get_element(@search_button, 'Xpath')
    element.click
  end
end
