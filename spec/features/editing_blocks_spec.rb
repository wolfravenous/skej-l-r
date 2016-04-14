require "rails_helper"


RSpec.feature "Users can edit existing blocks" do
  #Given
  before do
    FactoryGirl.create(:block, day: "Monday AM")
    
    visit "/"
    click_link "Monday AM"
    click_link "Edit Block"
  end

  #Given
  scenario "with valid attributes" do
    #When
    fill_in "Day", with: "Monday PM"
    click_button "Update Block"
    #Then
    expect(page).to have_content "Block has been updated."
    expect(page).to have_content "Monday PM"
  end
  
  #Given
  scenario "when providing invalid attributes" do
    #When
    fill_in "Day", with: ""
    click_button "Update Block"
    #Then
    expect(page).to have_content "Block has not been updated."
  end

end