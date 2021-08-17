require_relative 'base_page'

class TalentSearchResultPage < BasePage
  def initialize(driver = nil)
    super(driver)
    @talents = '//*[@class="up-card-section up-card-hover"]'
    @identify_name = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class,  "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/button/div[@class="identity-name"]'
    @freelancer_title = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class,  "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/p'
    @country_name = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class,  "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/div/span[@itemprop="country-name"]'
    @profile_overview = 'div[contains(@class, "freelancer-tile")]/div/div[@class="mt-10"]/div[contains(@class, "up-line-clamp-v2-wrapper")]/div[contains(@class, "up-line-clamp-v2")]'
    @skills = 'div[contains(@class,  "skills")]/div/div[@class="up-skill-wrapper"]/div[@class="up-skill-badge"]'
  end

  def gather_talents
    self.get_elements(@talents, 'Xpath').each_with_index do |talent, position|
      talent_name = self.get_child_element(talent, @identify_name, 'Xpath').text
      profile_title = self.get_child_element(talent, @freelancer_title, 'Xpath').text
      country = self.get_child_element(talent, @country_name, 'Xpath').text
      profile_overview = self.get_child_element(talent, @profile_overview, 'Xpath').text
      skills = []
      self.get_child_elements(talent, @skills, 'Xpath').each_with_index do |skill, skill_position|
        skills.push(skill.text)
      end
    end
  end
end
