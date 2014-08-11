require 'rails_helper'
require 'capybara/rails'

feature 'User Path' do
  scenario "visit about page" do
    visit "/"
    click_on "About"
    expect(page).to have_content "All about taskly"
  end

  scenario 'User can view task lists' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    # TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Work List")
    # expect(page).to have_content("Household Chores")

    click_on "Edit"



    fill_in "Name", :with => "Work List Work"

    click_on "Edit Task List"

    expect(page).to have_content "Work List Work"

    click_on "Add Task List"

    expect(page).to have_content "Add a task list"

    fill_in "Name", :with => "Live it up"

    click_on "Create task list"

    expect(page).to have_content "Live it up"

    click_on "Add Task List"

    click_on "Create task list"

    expect(page).to have_content "Your task could not be created"





  end

end