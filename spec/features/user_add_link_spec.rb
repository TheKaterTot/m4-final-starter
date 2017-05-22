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

  scenario "user submits invalid link" do
    login(user)

    within("#new-link") do
      fill_in("Url", with: "nogood")
      fill_in("Title", with: "No")
      click_on("Add Link")
    end

    within(".links") do
      expect(page).to_not have_content("nogood")
    end

    within(".errors") do
      expect(page).to have_content("is not a valid URL")
    end

  end
end
