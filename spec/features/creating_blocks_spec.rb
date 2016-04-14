require "rails_helper"

RSpec.feature  "Users can create new blocks" do 
	scenario "with valid attributes" do
		visit "/"

		click_link "New Block"

		fill_in "Day", with: "Monday AM"
		fill_in "Time", with: "11:40-12:10"
		click_button "Create Block"

		expect(page).to have_content "Block has been created."

		block = Block.find_by(day: "Monday AM")
		expect(page.current_url).to eq block_url(block)

		title = "Monday AM - Blocks - Skejələr"
		expect(page).to have_title title
	end
end