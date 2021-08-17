require_relative '../../pages/visitor_home_page'
require_relative '../../pages/talent_search_result_page'

class SearchOfTalents
  def initialize
    @visitor_home_page = VisitorHomePage.new
    @talent_search_result_page = nil
    super
  end

  def go_to
    @visitor_home_page.navigate_to 'https://www.upwork.com/'
  end

  def click_search_source_button
    @visitor_home_page.click_search_source_button
  end

  def click_talent_option
    @visitor_home_page.click_talent_option
  end

  def click_search_input
    @visitor_home_page.click_search_input("Gabriel Morales")
  end

  def click_search_button
    @visitor_home_page.click_search_button
  end

  def gather_talents
    @talent_search_result_page = TalentSearchResultPage.new(@visitor_home_page.driver)
    @talent_search_result_page.gather_talents
  end

  def execute_test
    self.go_to
    self.click_search_source_button
    self.click_talent_option
    self.click_search_input
    self.click_search_button
    talents = self.gather_talents
    puts 'a'
  end
end
