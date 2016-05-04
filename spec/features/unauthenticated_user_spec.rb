require "rails_helper"

feature "Unauthenticated user" do
  scenario "user sees a login or signup page" do
    visit "/"

    # expect(current_path).to eq("/welcome")
    expect(page).to have_content("Log In or Sign Up")
    expect(page).to have_link("Log In")
    expect(page).to have_link("Sign Up")
  end

  scenario "first time user can create an account" do
    visit root_path

    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_on "Submit"

    expect(current_path).to eq(links_path)
    expect(page).to have_content()
  end
end
