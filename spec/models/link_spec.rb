require "rails_helper"

describe Link do
  it { should validate_presence_of(:url) }
  it { should belong_to(:user) }

  it "should validate URL" do
    user = Fabricate(:user)
    link = Link.new(title: "Google", url: "defnotgoogle", user: user)

    link.save

    expect(link.errors[:url]).to eq(["is not a valid URL"])
  end
end
