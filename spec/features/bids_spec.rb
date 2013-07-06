require 'spec_helper'

describe "Bids" do
  it "should have content Login" do
    visit new_user_session_path
    expect(page).to have_content('Login')
  end
end
