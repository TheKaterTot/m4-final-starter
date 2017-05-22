require "rails_helper"

feature "user can edit a link" do
  let(:user) { Fabricate(:user) }
  let!(:link) { Fabricate(:link, user: user) }
  scenario "they successfully edit a link" do
    login(user)

    within(".links #link-#{link.id}") do
      click_on("Edit")
    end

    expect(current_path).to eq(edit_link_path(link.id))

    within("#update-link") do
      fill_in("Title", with: "Learnin'")
    end

    click_on("Save")

    expect(current_path).to eq(root_path)
    expect(find(".flash")).to have_content("Link updated")
  end

  scenario "they update with invalid info" do
    login(user)

    within(".links #link-#{link.id}") do
      click_on("Edit")
    end

    expect(current_path).to eq(edit_link_path(link.id))

    within("#update-link") do
      fill_in("Url", with: "no")
    end

    click_on("Save")
    expect(find(".errors")).to have_content("is not a valid URL")
  end
end
