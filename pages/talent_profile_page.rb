require_relative 'base_page'

class TalentProfilePage < BasePage
  def initialize(driver = nil)
    super(driver)
    @identify_name = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class,  "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/button/div[@class="identity-name"]'
    @freelancer_title = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class,  "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/p'
    @country_name = 'div[contains(@class,  "freelancer-tile")]/div/div/div[contains(@class,  "cfe-ui-freelancer-tile-identity")]/div[@class="identity-content"]/div/span[@itemprop="country-name"]'
    @profile_overview = 'div[contains(@class, "freelancer-tile")]/div/div[@class="mt-10"]/div[contains(@class, "up-line-clamp-v2-wrapper")]/div[contains(@class, "up-line-clamp-v2")]'
    @skills = 'div[contains(@class,  "skills")]/div/div[@class="up-skill-wrapper"]/div[@class="up-skill-badge"]'
  end

  def self.gather_talent
    # code here
  end
end

