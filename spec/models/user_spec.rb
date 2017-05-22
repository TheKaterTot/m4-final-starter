require "rails_helper"

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }
  it { should validate_confirmation_of(:password).on(:create) }

  it "should validate uniqueness of email" do
    user = Fabricate(:user)

    user_2 = User.new(email: user.email, password: "pass", password_confirmation: "pass")

    user_2.save
    expect(user_2.errors[:email]).to eq(["has already been taken"])
  end
end
