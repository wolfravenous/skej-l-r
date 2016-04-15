require "rails_helper"

RSpec.feature "Users can view topics" do
  before do
    mondayam = FactoryGirl.create(:block, day: "Monday AM")
    FactoryGirl.create(:topic, block: mondayam,
      name: "Science Study Hall",
      description: "A Place to study frogs.")

    mondaypm = FactoryGirl.create(:block, day: "Monday PM")
    FactoryGirl.create(:topic, block: mondaypm,
      name: "English Study Hall", description: "A Place to write poems about frogs.")

    visit "/"
  end

  scenario "for a given block" do
    click_link "Monday AM"

    expect(page).to have_content "Science Study Hall"
    expect(page).to_not have_content "English Study Hall"

    click_link "Science Study Hall"
    within("#topic h2") do
      expect(page).to have_content "Science Study Hall"
    end

    expect(page).to have_content "A Place to study frogs."
  end
end