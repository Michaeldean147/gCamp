require 'rails_helper'

feature 'User signout' do
  scenario 'user signs out' do

    visit root_path
    click_on 'Sign Up'
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "smith999@osu.edu"
    fill_in "Password", with: "buckeyes"
    fill_in "Password confirmation", with: "buckeyes"

    within('.well') do
      click_on "Sign up"
    end

    click_on "Sign Out"
    expect(page).to have_content("Sign Up")
  end
end
