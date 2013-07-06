require 'spec_helper'


describe "Bids" do
  
  let!(:event) {FactoryGirl.create(:event) }
  let!(:item) {FactoryGirl.create(:item) }
  let(:user) {FactoryGirl.create(:user) }
  
  subject {page}

  describe "Event Show Page Form" do
    
    before do 
      visit new_user_session_path
      fill_in "Email",    with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Login"
      visit event_path(event) 
    end

    it { should have_content 'Event Name' }
    it { should have_button 'Bid'}

      
    describe "with valid information" do
      before do 
        fill_in "bid_bid_amount", with: '130'
        click_button "Bid" 
      end
      it "should create a bid" do
        page.should have_content "Bid was successfully created." 
      end
    end

    describe "with invalid information" do
      before do
        fill_in "bid_bid_amount", with: '124'
        click_button "Bid"
      end
      it "should not create a bid" do
        page.should have_content "Please review the problems below:"
      end
    end
  end
  
  describe "My Bids Page" do
    before do 
      visit new_user_session_path
      fill_in "Email",    with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Login"
      visit event_path(event)
      fill_in "bid_bid_amount", with: '130'
      click_button "Bid"
    end 
    it {should have_content "My Bids"}
    it {should have_content "Current Top Bidder"}

    describe "not the highest bidder" do
      let(:user2) {FactoryGirl.create(:user, name: "Bidder 2", email: "bidder2@example.com")}
      before do 
        FactoryGirl.create(:bid, bid_amount: 131, user_id: 2 )
        visit _my_bids_path 
      end
      it {should have_content "Not Top Bidder"}
      
      describe "raising the bid" do
        before do
          fill_in "bid_bid_amount", with: '132'
          click_button "Bid"
        end
        it {should have_content "Current Top Bidder"}
      end
    end
  end
end

