require_relative 'base_page'

class TalentSearchResultPage < BasePage
  def initialize(driver = nil)
    super(driver)
    @talents = '//*[@class="up-card-section up-card-hover"]'
    @identify_name = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class, "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/button/div[@class="identity-name"]'
    @freelancer_title = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class, "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/p'
    @country_name = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class, "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/div/span[@itemprop="country-name"]'
    @profile_overview = 'div[contains(@class, "freelancer-tile")]/div/div[@class="mt-10"]/div[contains(@class, "up-line-clamp-v2-wrapper")]/div[contains(@class, "up-line-clamp-v2")]'
    @skills = 'div[contains(@class,  "skills")]/div/div[@class="up-skill-wrapper"]/div[@class="up-skill-badge"]'
  end

  def gather_talents
    talents = []
    get_elements(@talents, 'Xpath').each_with_index do |talent, position|
      skills = []
      get_child_elements(talent, @skills, 'Xpath').each do |skill|
        skills.push(skill.text)
      end
      talent = {
        'position' => position,
        'talent_name' => get_child_element(talent, @identify_name, 'Xpath').text,
        'profile_title' => get_child_element(talent, @freelancer_title, 'Xpath').text,
        'country' => get_child_element(talent, @country_name, 'Xpath').text,
        'profile_overview' => get_child_element(talent, @profile_overview, 'Xpath').text,
        'skills' => skills
      }
      talents.push(talent)
    end
    talents
  end

  def click_talent_by_position(talent_position)
    talent = get_elements(@talents, 'Xpath')[talent_position]
    talent.click
  end
end
