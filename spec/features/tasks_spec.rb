require 'rails_helper'

feature 'CRUDing Tasks' do
  scenario 'user deletes a task' do
    project = Project.create!(
      name: "Project",
    )

    visit project_tasks_path(project)
    click_on "New Task"
    fill_in "Description", with: "Test"
    fill_in "Due date", with: Date.today
    click_on "Create Task"
    click_on "Back"
    click_on "Destroy"

    expect(page).to have_content("Task was successfully destroyed")
  end

  scenario 'user creates a task' do
    project = Project.create!(
      name: "Test",
    )
    visit project_tasks_path(project)
    click_on "New Task"
    fill_in "Description", with: "Test"
    fill_in "Due date", with: Date.today


    click_on "Create Task"
    expect(page).to have_content("Test")
  end

  scenario 'user edits a task' do
    project = Project.create!(
      name: "Test",
    )

    visit project_tasks_path(project)
    click_on "New Task"
    fill_in "Description", with: "Test"
    fill_in "Due date", with: Date.today
    click_on "Create Task"
    click_on "Edit"
    fill_in "Description", with: "Tested"
    click_on "Update Task"
    expect(page).to have_content("Tested")
  end

  scenario 'user visits show page' do
    project = Project.create!(
      name: "Test",
    )

    visit project_tasks_path(project)
    click_on "New Task"
    fill_in "Description", with: "Test"
    fill_in "Due date", with: Date.today
    click_on "Create Task"
    click_on "Back"
    click_on "Show"
    expect(page).to have_content "Description: Test"
  end

end
