require "rails_helper"

feature "Unauthenticated user" do
  scenario "user sees a login or signup page" do
    visit "/"

    expect(page).to have_content "Log In or Sign Up"
    expect(page).to have_link "Log In"
    expect(page).to have_link "Sign Up"
  end

  scenario "first time user can create an account" do
    visit root_path

    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)
    expect(page).to have_content "Create an Account!"

    fill_in "Email", with: "penney@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"

    expect(current_path).to eq(links_path)
    expect(page).to have_content "Account Created!"
    expect(page).to have_content "Your Links"
    expect(page).to have_content "Add a New Link"
  end

  scenario "password confirmation must match password" do
    visit root_path
    click_on "Sign Up"

    fill_in "Email", with: "penney@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "pass"
    click_on "Create Account"

    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario "email must be unique" do
    visit root_path
    create(:user)

    click_on "Sign Up"

    fill_in "Email", with: "penney@email.com"
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    click_on "Create Account"

    expect(page).to have_content "Email has already been taken"
  end

  scenario "email must be valid" do
    visit root_path
    create(:user)

    click_on "Sign Up"

    fill_in "Email", with: "penney@email..com"
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    click_on "Create Account"

    expect(page).to have_content "Email is invalid"

    fill_in "Email", with: "bob"
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    click_on "Create Account"

    expect(page).to have_content "Email is invalid"

    fill_in "Email", with: "penney@email."
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    click_on "Create Account"

    expect(page).to have_content "Email is invalid"
  end
end
