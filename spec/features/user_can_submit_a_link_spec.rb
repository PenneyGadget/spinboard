require "rails_helper"

feature "User submits a new link" do
  scenario "a valid link is added to the page" do
    user = create(:user)
    login(user)

    fill_in "title", with: "Adventure time!"
    fill_in "url", with: "http://youshouldgohere.com/"
    click_on "Submit"

    expect(current_path).to eq(links_path)
    expect(page).to have_content "New link saved!"
    expect(page).to have_content "Adventure time!"
    expect(page).to have_content "http://youshouldgohere.com/"
    expect(page).to have_content "Read?"
    expect(page).to have_content "false"
  end

  scenario "invalid links are rejected" do

  end
end
