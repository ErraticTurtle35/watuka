require_relative '../../pages/visitor_home_page'
require_relative '../../pages/talent_search_result_page'
require_relative '../../pages/talent_profile_page'

class SearchOfTalents
  def initialize
    @visitor_home_page = VisitorHomePage.new
    @talent_search_result_page = nil
    @talent_profile_page = nil
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

  def validate_keywords(talents)
    # code here
  end

  def click_random_talent(random_talent_position)
    @talent_search_result_page.click_talent_by_position(random_talent_position)
  end

  def get_random_talent_position
    rand(0..9)
  end

  def get_random_talent
    @talent_profile_page = TalentProfilePage.new(@talent_search_result_page.driver)
    @talent_profile_page.gather_talent
  end

  def validate_talent(random_talent, talents, random_talent_position)
    # code here
  end

  def execute_test
    self.go_to
    self.click_search_source_button
    self.click_talent_option
    self.click_search_input
    self.click_search_button
    talents = self.gather_talents
    self.validate_keywords(talents)
    random_talent_position = self.get_random_talent_position
    self.click_random_talent random_talent_position
    random_talent = self.get_random_talent
    self.validate_talent(random_talent, talents, random_talent_position)
    puts 'a'
  end
end
