require "rails_helper"

describe "user can add links from homepage", :js => true do
  let(:user) { Fabricate(:user) }

  scenario "user submits new link" do
    login(user)

    within("#new-link") do
      fill_in("Url", with: "http://google.com")
      fill_in("Title", with: "google")
      click_on("Add Link")
    end

    within(".links") do
      expect(page).to have_content("google")
    end
  end
end
