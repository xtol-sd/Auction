require 'spec_helper'

describe "Items" do


  let!(:event) {FactoryGirl.create(:event) }
  let!(:item) {FactoryGirl.create(:item) }
  let!(:donation) {FactoryGirl.create(:donation) }
  let(:user) {FactoryGirl.create(:user) }
  let(:admin) {FactoryGirl.create(:admin)}

  subject {page}

  describe "when item is approved, Approval appears" do
    before do 
      visit new_user_session_path
      fill_in "Email",    with: admin.email.upcase
      fill_in "Password", with: admin.password
      click_button "Login"
      visit donations_path
    end
    it { should have_content 'Approved'}
  end
  
end
