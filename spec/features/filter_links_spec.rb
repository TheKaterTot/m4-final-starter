require "rails_helper"

feature "user can filter links", :js => true do
  let(:user) { Fabricate(:user) }
  let!(:link) { Fabricate(:link, title: "Hello", read: true, user: user) }
  let!(:link2) { Fabricate(:link, title: "no", user: user) }

  scenario "filter by read" do
    login(user)

    click_on("Show Read")

    within("#all-links") do
      expect(page).to have_content("Hello")
      expect(page).to_not have_content("no")
    end

  end

  scenario "filter by unread" do
    login(user)

    click_on("Show Unread")

    within("#all-links") do
      expect(page).to have_content("no")
      expect(page).to_not have_content("Hello")
    end

  end
end
