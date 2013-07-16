require 'spec_helper'


describe "Bids" do
  
  let!(:event) {FactoryGirl.create(:event) }
  let!(:item) {FactoryGirl.create(:item) }
  let(:user) {FactoryGirl.create(:user) }
  
  subject {page}

  describe "when logged in" do
    before do 
      visit new_user_session_path
      fill_in "Email",    with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Login"
    end
    
    describe "the Event Show Page" do
      before do 
        visit event_path(event) 
      end

      it { should have_content 'Event Name' }
      it { should have_button 'Bid'}
    
      describe "user can create a bid" do 

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
      
      describe "when the event is finished" do
        before do
          event.end_datetime = DateTime.now - 1.week
          event.save
          visit event_path(event)
        end
        it "page should not display a bid form" do
          page.should_not have_button 'Bid'
        end
      end
    end

    describe "on the My Bids Page" do
      
      before do
        visit _my_bids_path
      end

      it {should have_content "My Bids"}

      describe "user has no bids" do
        it {should have_content "You have not yet bid on any items."}
      end

      describe "user places the first bid on an item" do
        before do 
          visit event_path(event)
          fill_in "bid_bid_amount", with: '130'
          click_button "Bid"
        end 
        
        it {should have_content "Current Top Bidder"}
      
        describe "another user places a higher bid on the same item" do
          let(:user2) {FactoryGirl.create(:user, name: "Bidder 2", email: "bidder2@example.com")}
          before do 
            FactoryGirl.create(:bid, bid_amount: 135, user_id: 2 )
            visit _my_bids_path 
          end
          it {should have_content "Not Top Bidder"}
          
          describe "user can place a higher bid" do
            before do
              fill_in "bid_bid_amount", with: 140
              click_button "Bid"
            end
            it {should have_content "Current Top Bidder"}
          end
        end
      end
    end
  end

  describe "when not logged in" do
    before { visit root_path } 
    it {should_not have_button 'Bid'}
    it {should have_content "Event Name"}

    describe "when auction is finished" do
      before do
        event.end_datetime = DateTime.now - 1.week
        event.save
      end
      it {should have_content "Event Name"}
    end
  end
end

