require "rails_helper"

RSpec.feature "Users can delete topics" do
  let(:block) { FactoryGirl.create(:block) }
  let(:topic)  { FactoryGirl.create(:topic, block: block) }

  before do
    visit block_topic_path(block, topic)
  end

  scenario "successfully" do
    click_link "Delete Topic"

    expect(page).to have_content "Topic has been deleted."
    expect(page.current_url).to eq block_url(block)
  end
end