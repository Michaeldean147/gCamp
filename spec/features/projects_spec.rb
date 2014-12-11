require 'rails_helper'

feature 'CRUDing Projects' do
  scenario 'user deletes a project' do
    Project.create!(
      name: "Test",
    )

    visit projects_path
    click_on "Test"
    click_on "Delete"

    expect(page.current_path).to eq projects_path
  end

  scenario 'user creates a project' do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "Test"
    click_on "Create Project"

    expect(page).to have_content("Test")
  end

  scenario 'user edits a project' do
    Project.create!(
      name: "Test",
    )

    visit projects_path
    click_on "Test"
    click_on "Edit"
    fill_in "Name", with: "Tested"
    click_on "Update Project"
    expect(page).to have_content("Tested")
  end

  scenario 'user visits show page' do
    project = Project.create!(
      name: "Test",
    )

    visit projects_path
    click_on "Test"

    expect(page.current_path).to eq project_path(project)
  end
end
