require 'rails_helper'

feature 'CRUDing Users' do
  scenario 'user deletes a user' do
    User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "smith999@osu.edu",
      password: "buckeyes"
    )

    visit users_path
    click_on "John Smith"
    click_on "Edit"
    click_on "Delete"

    expect(page.current_path).to eq users_path
  end

  scenario 'user creates a user' do
    visit users_path
    click_on "New User"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "smith999@osu.edu"
    fill_in "Password", with: "buckeyes"
    fill_in "Password confirmation", with: "buckeyes"

    click_on "Create User"

    expect(page).to have_content("John Smith")
  end

  scenario 'user edits a user' do
    User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "smith999@osu.edu",
      password: "buckeyes"

    )

    visit users_path
    click_on "John Smith"
    click_on "Edit"
    fill_in "First name", with: "Johnny"
    click_on "Update User"
    expect(page).to have_content("Johnny Smith")
  end

  scenario 'user visits show page' do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "smith999@osu.edu",
      password: "buckeyes"
    )

    visit users_path
    click_on "John Smith"

    expect(page.current_path).to eq user_path(user)
  end




end
