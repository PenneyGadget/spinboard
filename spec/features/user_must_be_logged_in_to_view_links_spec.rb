require "rails_helper"

feature "User must be logged in to visit /links" do
  scenario "they are redirected to root page if not logged in" do
    visit links_path
    expect(current_path).to eq(root_path)

    user = create(:user)
    login(user)
    expect(current_path).to eq(links_path)

    click_on "Log Out"
    visit links_path
    expect(current_path).to eq(root_path)
  end
end
