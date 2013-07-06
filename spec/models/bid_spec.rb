require 'spec_helper'

describe Bid do

  let(:user) {FactoryGirl.create(:user) }
  let(:item) {FactoryGirl.create(:item) }
  before do
    @bid = user.bids.build( item_id: item.id, bid_amount: "130")
  end
  
  subject { @bid }
  it { should respond_to(:bid_amount) }
  it { should respond_to(:item_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  its(:user) { should == user }
  it { should respond_to(:item)}
  its(:item) { should == item }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @bid.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank bid amount" do
    before { @bid.bid_amount = nil }
    it { should_not be_valid }
  end

  describe "with non-number bid-amount" do
    before { @bid.bid_amount = "abc" }
    it { should_not be_valid }
  end

  describe "with a lower amount than the current bid" do
    before { @bid.bid_amount = "124" }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Bid.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

end

