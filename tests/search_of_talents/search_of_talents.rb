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

  def validate_keywords(talents)
    talents.each do |talent|
      if talent['talent_name'].include? @configuration_reader.read_configuration['searchKeyword']
        puts 'Yups talent_name'
      end

      if talent['profile_title'].include? @configuration_reader.read_configuration['searchKeyword']
        puts 'Yups profile_title'
      end

      if talent['country'].include? @configuration_reader.read_configuration['searchKeyword']
        puts 'Yups country'
      end

      if talent['profile_overview'].include? @configuration_reader.read_configuration['searchKeyword']
        puts 'Yups profile_overview'
      end

      if talent['skills'].include? @configuration_reader.read_configuration['searchKeyword']
        puts 'Yups skills'
      end
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

  def validate_talent(random_talent, talents, talent_position)
    talent = talents[talent_position]
    if talent['talent_name'] == random_talent['talent_name']
      puts 'Yups talent_name'
    end

    if talent['profile_title'] == random_talent['profile_title']
      puts 'Yups profile_title'
    end

    if talent['country'] == random_talent['country']
      puts 'Yups country'
    end

    if talent['profile_overview'] == random_talent['profile_overview']
      puts 'Yups profile_overview'
    end

    if talent['skills'] == random_talent['skills']
      puts 'Yups skills'
    end
  end

  def validate_random_talent(random_talent)
    if random_talent['talent_name'].include? @configuration_reader.read_configuration['searchKeyword']
      puts 'Yups talent_name'
    end

    if random_talent['profile_title'].include? @configuration_reader.read_configuration['searchKeyword']
      puts 'Yups profile_title'
    end

    if random_talent['country'].include? @configuration_reader.read_configuration['searchKeyword']
      puts 'Yups country'
    end

    if random_talent['profile_overview'].include? @configuration_reader.read_configuration['searchKeyword']
      puts 'Yups profile_overview'
    end

    if random_talent['skills'].include? @configuration_reader.read_configuration['searchKeyword']
      puts 'Yups skills'
    end
  end

  def execute_test
    go_to
    click_search_source_button
    click_talent_option
    click_search_input
    click_search_button
    talents = gather_talents
    validate_keywords(talents)
    random_talent_position = get_random_talent_position
    click_random_talent random_talent_position
    random_talent = get_random_talent
    validate_random_talent(random_talent)
    validate_talent(random_talent, talents, random_talent_position)
    puts 'a'
  end
end
