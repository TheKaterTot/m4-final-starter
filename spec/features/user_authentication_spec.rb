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

  scenario "guest clicks sign up" do
    user = Fabricate.build(:user)

    visit login_path

    within("#login") do
      click_link("Sign up!")
    end

    expect(current_path).to eq(new_user_path)

    within("#new-user-form") do
      fill_in("Email", with: user.email)
      fill_in("Password", with: user.password)
      fill_in("Password confirmation", with: user.password)
    end

    click_on("Create Account")

    expect(current_path).to eq(root_path)
  end

  scenario "guest signs up with email that is taken" do
    user = Fabricate(:user)

    visit new_user_path

    within("#new-user-form") do
      fill_in("Email", with: user.email)
      fill_in("Password", with: user.password)
      fill_in("Password confirmation", with: user.password)
    end

    click_on("Create Account")

    expect(find(".errors")).to have_content("Email has already been taken")
  end

  scenario "guest password and password confirmation do not match" do
    user = Fabricate(:user)

    visit new_user_path

    expect(current_path).to eq(new_user_path)

    within("#new-user-form") do
      fill_in("Email", with: user.email)
      fill_in("Password", with: user.password)
      fill_in("Password confirmation", with: "no")
    end

    click_on("Create Account")

    expect(find(".errors")).to have_content("Password confirmation doesn't match Password" )
  end

  scenario "guest must sign up with email and password" do

    visit new_user_path

    expect(current_path).to eq(new_user_path)

    within("#new-user-form") do
      fill_in("Email", with: "")
      fill_in("Password", with: "")
      fill_in("Password confirmation", with: "")
    end

    click_on("Create Account")

    expect(find(".errors")).to have_content("Email can't be blank")
  end

  scenario "guest signs in to preexisting account" do
    user = Fabricate(:user)

    visit login_path

    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)

    click_on("Log In")

    expect(current_path).to eq(root_path)

    expect(find(".flash")).to have_content("Successfully logged in!")

    within(".user-info") do
      expect(page).to have_link("Sign out")
    end
  end

  scenario "guest signs out of account" do
    user = Fabricate(:user)
    login(user)

    expect(current_path).to eq(root_path)

    within(".user-info") do
      click_on("Sign out")
    end

    expect(current_path).to eq(login_path)
  end
end
