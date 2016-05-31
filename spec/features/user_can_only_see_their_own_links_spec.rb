require "rails_helper"

feature "User can only see their own links" do
  scenario "other users accounts are private" do
    visit root_path
    user = create(:user)
    login(user)

    expect(current_path).to eq(links_path)

    fill_in "title", with: "New Cool Link"
    fill_in "url", with: "http://youshouldgohere.com/"
    click_on "Submit"
    click_on "Log Out"

    visit root_path
    click_on "Sign Up"
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bob@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"

    expect(current_path).to eq(links_path)
    expect(page).to_not have_content "New Cool Link"
    expect(page).to_not have_content "http://youshouldgohere.com/"
  end
end
