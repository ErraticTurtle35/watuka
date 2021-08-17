require_relative 'base_page'

class TalentProfilePage < BasePage
  def initialize(driver = nil)
    super(driver)
    @profile_viewer_class = 'profile-viewer'
    @profile_viewer_child = 'div/div/div/section/div/div/div'
    @identity_content_class = 'identity-content'
    @talent_name = 'div/h1'
    @profile_section = 'div/div/div/section[@class="row"]'
    @profile_section_container_div_class = 'min-width-0'
    @profile_title = 'section/div/div/div/h2'
    @country = 'div/span[contains(@itemprop, "country-name")]'
    @profile_overview = 'section/div[@class="row"]/div[contains(@class,"up-line-clamp-v2")]'
  end

  def gather_talent
    talent_name = get_talent_name_element
    profile_title = get_profile_title_element
    country = get_country_element
    profile_overview = get_profile_overview_element
    skills = []
    get_skill_elements.each do |skill|
      skills.push(skill.text)
    end
    {
      'talent_name' => talent_name.text,
      'profile_title' => profile_title.text,
      'country' => country.text,
      'profile_overview' => profile_overview.text,
      'skills' => skills
    }
  end

  def get_skill_elements
    profile_viewer = self.get_element(@profile_viewer_class, 'ClassName')
    profile_section = get_child_element(profile_viewer, @profile_section, 'Xpath')
    profile_section_container_div = get_child_element(profile_section, @profile_section_container_div_class, 'ClassName')
    self.get_child_elements(profile_section_container_div, 'section[last()]/div/ul/li', 'Xpath')
  end

  def get_profile_overview_element
    profile_viewer = self.get_element(@profile_viewer_class, 'ClassName')
    profile_section = get_child_element(profile_viewer, @profile_section, 'Xpath')
    profile_section_container_div = get_child_element(profile_section, @profile_section_container_div_class, 'ClassName')
    profile_overview = self.get_child_element(profile_section_container_div, @profile_overview, 'Xpath')
    self.get_child_element(profile_overview, 'text-pre-line', 'ClassName')
  end

  def get_country_element
    profile_viewer = self.get_element(@profile_viewer_class, 'ClassName')
    profile_viewer_child = self.get_child_element(profile_viewer, @profile_viewer_child, 'Xpath')
    identity_content = self.get_child_element(profile_viewer_child, @identity_content_class, 'ClassName')
    country_container = self.get_child_element(identity_content, 'd-block', 'ClassName')
    self.get_child_element(country_container, @country, 'Xpath')
  end

  def get_profile_title_element
    profile_viewer = self.get_element(@profile_viewer_class, 'ClassName')
    profile_section = get_child_element(profile_viewer, @profile_section, 'Xpath')
    profile_section_container_div = get_child_element(profile_section, @profile_section_container_div_class, 'ClassName')
    get_child_element(profile_section_container_div, @profile_title, 'Xpath')
  end

  def get_talent_name_element
    profile_viewer = self.get_element(@profile_viewer_class, 'ClassName')
    profile_viewer_child = self.get_child_element(profile_viewer, @profile_viewer_child, 'Xpath')
    identity_content = self.get_child_element(profile_viewer_child, @identity_content_class, 'ClassName')
    self.get_child_element(identity_content, @talent_name, 'Xpath')
  end
end

