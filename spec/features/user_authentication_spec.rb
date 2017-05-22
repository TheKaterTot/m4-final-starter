require "rails_helper"

feature "user authentication" do
  scenario "guest visits root" do
    visit root_path

    expect(current_path).to eq(login_path)
    within("#login") do
      expect(page).to have_content("Sign In")
      expect(page).to have_content("New user? Sign up!")
    end
  end
end
