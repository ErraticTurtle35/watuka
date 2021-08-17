require_relative '../pages/visitor_home_page'
require_relative '../pages/talent_search_result_page'

class FirstAttempt
  def initialize
    @visitor_home_page = VisitorHomePage.new
    super
  end

  def go_to
    @visitor_home_page.navigate_to 'https://www.upwork.com/'
  end

  def click_search_source_button
    element = @visitor_home_page.get_element(@visitor_home_page.switch_search_source_button, 'Xpath')
    element.click
  end

  def click_talent_option
    element = @visitor_home_page.get_element(@visitor_home_page.freelancers_options, 'Xpath')
    element.click
  end

  def click_search_input
    element = @visitor_home_page.get_element(@visitor_home_page.search_talent_input, 'Xpath')
    element.send_keys "Gabriel Morales"
  end

  def click_search_button
    element = @visitor_home_page.get_element(@visitor_home_page.search_button, 'Xpath')
    element.click
  end

  def execute_test
    self.go_to
    self.click_search_source_button
    self.click_talent_option
    self.click_search_input
    self.click_search_button
    talent_search_result_page_new = TalentSearchResultPage.new(@visitor_home_page.driver)
    puts 'a'
  end
end
