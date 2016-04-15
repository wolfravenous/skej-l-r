require "rails_helper"

RSpec.feature "Users can create new topics" do
  before do
    block = FactoryGirl.create(:block, day: "Tuesday")

    visit block_path(block)
    click_link "New Topic"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "English Study Hall"
    fill_in "Description", with: "A place to study English"
    click_button "Create Topic"
Topic
    expect(page).to have_content "Topic has been created."
  end

  scenario "when providing invalid attributes" do
    click_button "Create Topic"

    expect(page).to have_content "Topic has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end


  scenario "with an invalid description" do
    fill_in "Name", with: "English Study Hall"
    fill_in "Description", with: "It sucks"
    click_button "Create Topic"

    expect(page).to have_content "Topic has not been created."
    expect(page).to have_content "Description is too short"
  end
end