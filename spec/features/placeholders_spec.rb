require "rails_helper"
require "shared_rutines"

RSpec.describe "placeholder page", type: :system do
  describe "placeholders" do
    it "shows the 'Under construction' page" do
      visit root_path
      expect(page).to have_content(I18n.t(:under_construction))
    end
  end
end
