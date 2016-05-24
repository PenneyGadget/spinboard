require "rails_helper"

feature "New user must have unique email" do
  scenario "duplicate emails not allowed" do
    create(:user)

    visit root_path
    click_on "Sign Up"

    fill_in "Email", with: "penney@email.com"
    fill_in "Password", with: "NewPersonPassword"
    fill_in "Password confirmation", with: "NewPersonPassword"
    click_on "Create Account"

    expect(page).to have_content "Email has already been taken"
    expect(current_path).to eq(users_path)
  end
end
