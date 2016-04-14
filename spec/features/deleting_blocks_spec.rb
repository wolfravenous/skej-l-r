require "rails_helper"

RSpec.feature "Users can delete blocks" do
  #Given
  scenario "successfully" do
    FactoryGirl.create(:block, day: "Monday AM")
    #When
    visit "/"
    click_link "Monday AM"
    click_link "Delete Block"
    #Then
    expect(page).to have_content "Block has been deleted."
    expect(page.current_url).to eq blocks_url
    expect(page).to have_no_content "Monday AM"
  end
end