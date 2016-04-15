require "rails_helper"

RSpec.feature "Users can edit existing topics" do
  let(:block) { FactoryGirl.create(:block) }
  let(:topic)  { FactoryGirl.create(:topic, block: block) }

  before do
    visit block_topic_path(block, topic)
    click_link "Edit Topic"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Tuesday AM"
    click_button "Update Topic"

    expect(page).to have_content "Topic has been updated."

    within("#topic h2") do
      expect(page).to have_content "Tuesday AM"
      expect(page).not_to have_content topic.name
    end
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Topic"

    expect(page).to have_content "Topic has not been updated."
  end
end