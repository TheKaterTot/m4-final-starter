require "rails_helper"

feature "user can search links", :js => true do
  let(:user) { Fabricate(:user) }
  let!(:link) { Fabricate(:link, title: "Hello", user: user) }
  let!(:link2) { Fabricate(:link, title: "no", user: user) }

  scenario "search by title" do
    login(user)

    fill_in 'link-search', :with => 'he'

    within("#all-links") do
      expect(page).to have_content("Hello")
      expect(page).to_not have_content("no")
    end

  end
end
