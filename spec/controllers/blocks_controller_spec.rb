require 'rails_helper'

RSpec.describe BlocksController, type: :controller do
  #Given
  it "handles a missing block correctly" do
    #When
    get :show, id: "not-here"
    #Then
    expect(response).to redirect_to(blocks_path)

    message = "The block you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end


end
