require "rails_helper"

feature "Unauthenticated user" do
  scenario "user sees a login or signup page" do
    visit "/"

    # expect(current_path).to eq("/welcome")
    expect(page).to have_content("Log In or Sign Up")
    expect(page).to have_link("Log In")
    expect(page).to have_link("Sign Up")
  end
end
