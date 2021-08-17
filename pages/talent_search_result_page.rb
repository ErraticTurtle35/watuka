require_relative 'base_page'

class TalentSearchResultPage < BasePage
  def initialize(driver = nil)
    super(driver)
    @talents = '//*[@class="up-card-section up-card-hover"]'
    @profile_title = "//div[contains(@class, 'freelancer-tile')]"
  end
end
