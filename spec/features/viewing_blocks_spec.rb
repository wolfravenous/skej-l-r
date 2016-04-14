require "rails_helper"

RSpec.feature "Users can view blocks" do
  #Given
  scenario "with the block details" do
    block = FactoryGirl.create(:block, day: "Monday AM")
    #When
    visit "/"
    click_link "Monday AM"
   	#Then
    expect(page.current_url).to eq block_url(block)
  end
end