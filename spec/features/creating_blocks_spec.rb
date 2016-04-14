require "rails_helper"

RSpec.feature  "Users can create new blocks" do 
	before do
		visit "/"

		click_link "New Block"
	end
	#Given
	scenario "with valid attributes" do
		#When
		fill_in "Day", with: "Monday AM"
		fill_in "Time", with: "11:40-12:10"
		click_button "Create Block"
		#Then
		expect(page).to have_content "Block has been created."

		block = Block.find_by(day: "Monday AM")
		expect(page.current_url).to eq block_url(block)

		title = "Monday AM - Blocks - Skejələr"
		expect(page).to have_title title
	end
	#Given
	scenario "when providing invalid attributes" do
		#When
  		click_button "Create Block"
  		#Then
  		expect(page).to have_content "Block has not been created."
  		expect(page).to have_content "Day can't be blank"
  		expect(page).to have_content "Time can't be blank"
	end
end