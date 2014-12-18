require 'rails_helper'

feature 'User signup' do
  scenario 'user signs up with valid information' do

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

    expect(page).to have_content("John Smith")
  end

  scenario 'user signs up without required information' do

    visit root_path
    click_on 'Sign Up'
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "smith999@osu.edu"

    within('.well') do
      click_on "Sign up"
    end

    expect(page).to have_content("Password can't be blank")
  end

  scenario 'user signs up with already taken email' do
    User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "smith999@osu.edu",
      password: "buckeyes"
    )

    visit root_path
    click_on 'Sign Up'
    fill_in "First name", with: "Doug"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "smith999@osu.edu"
    fill_in "Password", with: "buckeyes"
    fill_in "Password confirmation", with: "buckeyes"

    within('.well') do
      click_on "Sign up"
    end

    expect(page).to have_content("Email has already been taken")
  end
end
