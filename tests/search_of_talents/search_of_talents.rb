require_relative '../../pages/visitor_home_page'
require_relative '../../pages/talent_search_result_page'
require_relative '../../pages/talent_profile_page'
require_relative '../../utils/wakuta_configuration_reader'

SEARCH_OF_TALENT_DATA = '/data/search_of_talent_data.json'

class SearchOfTalents
  def initialize
    @visitor_home_page = nil
    @talent_search_result_page = nil
    @talent_profile_page = nil
    @configuration_reader = WakutaConfigurationReader.new(File.dirname(__FILE__), SEARCH_OF_TALENT_DATA)
  end

  def go_to
    @visitor_home_page = VisitorHomePage.new
    @visitor_home_page.navigate_to @configuration_reader.read_configuration['url']
  end

  def click_search_source_button
    @visitor_home_page.click_search_source_button
  end

  def click_talent_option
    @visitor_home_page.click_talent_option
  end

  def click_search_input
    @visitor_home_page.click_search_input(@configuration_reader.read_configuration['searchKeyword'])
  end

  def click_search_button
    @visitor_home_page.click_search_button
  end

  def gather_talents
    @talent_search_result_page = TalentSearchResultPage.new(@visitor_home_page.driver)
    @talent_search_result_page.gather_talents
  end

  def validate_keywords_in_talents(talents)
    talents.each(&method(:validate_keywords_in_talent))
  end

  def validate_keywords_in_talent(talent)
    keywords_in_name(talent)
    keywords_in_profile_title(talent)
    keywords_in_country(talent)
    keywords_in_profile_overview(talent)
    keywords_in_skills(talent)
  end

  def keywords_in_skills(talent)
    if talent['skills'].include? @configuration_reader.read_configuration['searchKeyword']
      puts 'Yups skills'
    else
      puts 'Nup skills'
    end
  end

  def keywords_in_profile_overview(talent)
    if talent['profile_overview'].include? @configuration_reader.read_configuration['searchKeyword']
      puts 'Yups profile_overview'
    else
      puts 'Nup profile_overview'
    end
  end

  def keywords_in_country(talent)
    if talent['country'].include? @configuration_reader.read_configuration['searchKeyword']
      puts 'Yups country'
    else
      puts 'Nup country'
    end
  end

  def keywords_in_profile_title(talent)
    if talent['profile_title'].include? @configuration_reader.read_configuration['searchKeyword']
      puts 'Yups profile_title'
    else
      puts 'Nup profile_title'
    end
  end

  def keywords_in_name(talent)
    if talent['talent_name'].include? @configuration_reader.read_configuration['searchKeyword']
      puts 'Yups talent_name'
    else
      puts 'Nup talent_name'
    end
  end

  def click_random_talent(talent_position)
    @talent_search_result_page.click_talent_by_position(talent_position)
  end

  def get_random_talent_position
    rand(0..9)
  end

  def get_random_talent
    @talent_profile_page = TalentProfilePage.new(@talent_search_result_page.driver)
    @talent_profile_page.gather_talent
  end

  def validate_random_talent(random_talent, talent)
    name_is_equal(random_talent, talent)
    profile_title_is_equal(random_talent, talent)
    country_is_equal(random_talent, talent)
    profile_overview_is_equal(random_talent, talent)
    skills_are_equal(random_talent, talent)
  end

  def skills_are_equal(random_talent, talent)
    if talent['skills'] == random_talent['skills']
      puts 'Yups skills'
    else
      puts 'Nup skills'
    end
  end

  def profile_overview_is_equal(random_talent, talent)
    if talent['profile_overview'] == random_talent['profile_overview']
      puts 'Yups profile_overview'
    else
      puts 'Nup profile_overview'
    end
  end

  def country_is_equal(random_talent, talent)
    if talent['country'] == random_talent['country']
      puts 'Yups country'
    else
      puts 'Nup country'
    end
  end

  def profile_title_is_equal(random_talent, talent)
    if talent['profile_title'] == random_talent['profile_title']
      puts 'Yups profile_title'
    else
      puts 'Nup profile_title'
    end
  end

  def name_is_equal(random_talent, talent)
    if talent['talent_name'] == random_talent['talent_name']
      puts 'Yups talent_name'
    else
      puts 'Nup talent_name'
    end
  end

  def execute_test
    go_to
    click_search_source_button
    click_talent_option
    click_search_input
    click_search_button
    talents = gather_talents
    validate_keywords_in_talents(talents)
    random_talent_position = get_random_talent_position
    click_random_talent random_talent_position
    random_talent = get_random_talent
    validate_keywords_in_talent(random_talent)
    validate_random_talent(random_talent, talents[random_talent_position])
  end
end
