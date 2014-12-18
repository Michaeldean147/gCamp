require 'rails_helper'

feature 'User signin' do
  scenario 'user signs in with valid information' do
    User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "smith999@osu.edu",
      password: "buckeyes"
    )

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "smith999@osu.edu"
    fill_in "Password", with: "buckeyes"

    within('.well') do
      click_on "Sign in"
    end
    expect(page).to have_content("John Smith")
  end

  scenario 'user signs in without valid information' do

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "smith999@osu.edu"
    fill_in "Password", with: "buckeyes"

    within('.well') do
      click_on "Sign in"
    end
    expect(page).to have_content("Username / password combination is invalid")
  end

  scenario 'user signs in with wrong information' do
    User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "smith999@osu.edu",
      password: "buckeyes"
    )

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "smith999@osu.edu"
    fill_in "Password", with: "buckeye"

    within('.well') do
      click_on "Sign in"
    end
    expect(page).to have_content("Username / password combination is invalid")
  end
end
