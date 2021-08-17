require_relative 'base_page'

class TalentProfilePage < BasePage
  def initialize(driver = nil)
    super(driver)
    @identify_name = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class,  "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/button/div[@class="identity-name"]'
    @freelancer_title = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class,  "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/p'
    @country_name = 'div[contains(@class, "freelancer-tile")]/div/div/div[contains(@class,  "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/div/span[@itemprop="country-name"]'
    @profile_overview = 'div[contains(@class, "freelancer-tile")]/div/div[@class="mt-10"]/div[contains(@class, "up-line-clamp-v2-wrapper")]/div[contains(@class, "up-line-clamp-v2")]'
    @skills = 'div[contains(@class,  "skills")]/div/div[@class="up-skill-wrapper"]/div[@class="up-skill-badge"]'
  end

  def gather_talent
    profile_viewer = self.get_element('profile-viewer', 'ClassName')
    profile_viewer_child = self.get_child_element(profile_viewer, 'div/div/div/section/div/div/div', 'Xpath')
    identity_content = self.get_child_element(profile_viewer_child, 'identity-content', 'ClassName')
    talent_name = self.get_child_element(identity_content, 'div/h1', 'Xpath')

    element1 = self.get_child_element(profile_viewer, 'div/div/div/section[@class="row"]', 'Xpath')
    element2 = self.get_child_element(element1, 'min-width-0', 'ClassName')
    element3 = self.get_child_element(element2, 'section/div/div/div/h2', 'Xpath')

    element4 = self.get_child_element(identity_content, 'd-block', 'ClassName')
    element5 = self.get_child_element(element4, 'div/span[contains(@itemprop, "country-name")]', 'Xpath')

    element6 = self.get_child_element(element2, 'section/div[@class="row"]/div[contains(@class,"up-line-clamp-v2")]', 'Xpath')
    element7 = self.get_child_element(element6, 'text-pre-line', 'ClassName')

    skills = []
    self.get_child_elements(element2, 'section[last()]/div/ul/li', 'Xpath').each_with_index do |skill, skill_position|
      skills.push(skill.text)
    end
    {
      'talent_name' => talent_name.text,
      'profile_title' => element3.text,
      'country' => element5.text,
      'profile_overview' => element7.text,
      'skills' => skills
    }
  end
end

