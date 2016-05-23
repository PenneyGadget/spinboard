require "rails_helper"

feature "User submits a new link" do
  scenario "a valid link is added to the page" do
    user = create(:user)
    login(user)

    fill_in "title", with: "Favorite cat videos"
    fill_in "url", with: "https://www.facebook.com/"
    click_on "Submit"

    expect(current_path).to eq(links_path)
    expect(page).to have_content "Favorite cat videos"
    expect(page).to have_content "https://www.facebook.com/"
    expect(page).to have_content "Read?"
    expect(page).to have_content "false"
  end

  scenario "invalid links are rejected" do

  end
end
