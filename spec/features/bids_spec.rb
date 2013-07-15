require 'spec_helper'


describe "Create a bid" do
  
  let!(:event) {FactoryGirl.create(:event) }
  let!(:item) {FactoryGirl.create(:item) }
  let(:user) {FactoryGirl.create(:user) }
  
  subject {page}

  describe "on the Event Show Page" do
    
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

    describe "when the event is finished" do
      before do
        event.end_datetime = DateTime.now - 1.day
        visit event_path(event)
      end
      it "page should not display a bid form" do
        page.should_not have_content 'Bid'
      end
    end 
  end
  
  describe "On the My Bids Page" do
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

    describe "when not the top bidder" do
      let(:user2) {FactoryGirl.create(:user, name: "Bidder 2", email: "bidder2@example.com")}
      before do 
        FactoryGirl.create(:bid, bid_amount: 135, user_id: 2 )
        visit _my_bids_path 
      end
      it {should have_content "Not Top Bidder"}
      
      describe "can raise the bid" do
        before do
          fill_in "bid_bid_amount", with: 140
          click_button "Bid"
        end
        it {should have_content "Current Top Bidder"}
      end
    end
  end
end

