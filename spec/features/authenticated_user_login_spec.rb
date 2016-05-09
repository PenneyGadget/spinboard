require "rails_helper"

feature "Authenticated user" do
  scenario "returning user can log in" do
    visit root_path
    user = create(:user)
    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content "Welcome back! Please log in:"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log In"

    expect(current_path).to eq(links_path)
    expect(page).to have_content "Your Links"
    expect(page).to have_content "Add a New Link"
    expect(page).to have_content "Log Out"

    click_on "Log Out"
    expect(current_path).to eq(login_path)
    expect(page).to have_content "Successfully logged out. Goodbye!"
  end
end
