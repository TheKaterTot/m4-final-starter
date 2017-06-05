require "rails_helper"

feature "can mark links as read", :js => :true do
  let(:user) { Fabricate(:user) }
  let!(:link) { Fabricate(:link, user: user) }

  scenario "Mark a link as read" do
    login(user)

    within('.links .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"
    
    within('.links .read-status') do
      expect(page).to have_text("true")
    end

  end
end

# feature "can mark links as unread", :js => true do
#   let(:user) { Fabricate(:user) }
#   let!(:link) { Fabricate(:link, user: user, read: true) }
#
#   scenario "Mark a link as read" do
#     login(user)
#
#     within('.links .read-status') do
#       expect(page).to have_text("true")
#     end
#
#     click_on "Mark as Read"
#
#     within('.links .read-status') do
#       expect(page).to have_text("false")
#     end
#
#   end
# end
