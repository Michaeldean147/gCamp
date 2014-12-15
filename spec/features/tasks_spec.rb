require 'rails_helper'

feature 'CRUDing Tasks' do
  scenario 'user deletes a task' do
    Task.create!(
      description: "Test",
      due_date: "2014-12-25",
    )

    visit tasks_path
    click_on "Destroy"

    expect(page.current_path).to eq tasks_path
  end

  scenario 'user creates a task' do
    visit tasks_path
    click_on "New Task"
    fill_in "Description", with: "Test"
    fill_in "Due date", with: "2014-12-25"


    click_on "Create Task"

    expect(page).to have_content("Test")
  end

  scenario 'user edits a task' do
    Task.create!(
      description: "Test",
      due_date: "2014-12-25",
    )

    visit tasks_path
    click_on "Edit"
    fill_in "Description", with: "Tested"
    click_on "Update Task"
    expect(page).to have_content("Tested")
  end

  scenario 'user visits show page' do
    task = Task.create!(
      description: "Test",
      due_date: "2014-12-25",
    )

    visit tasks_path
    click_on "Show"

    expect(page.current_path).to eq task_path(task)
  end

end
