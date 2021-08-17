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

end
