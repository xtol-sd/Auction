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

  describe "on the My Donations Page" do
      
      before do
        visit new_user_session_path
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Login"
        visit _my_donations_path
      end

      it {should have_content "My Donations"}

  end

  describe "on the Review Items Page" do
      
      before do
        visit new_user_session_path
        fill_in "Email",    with: admin.email.upcase
        fill_in "Password", with: admin.password
        click_button "Login"
        visit donations_path
      end

      it {should have_content "Review Items"}

  end

  
end
