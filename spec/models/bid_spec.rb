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

  it { should be_valid }

  describe "when user_id is not present" do
    before { @bid.user_id = nil }
    it { should_not be_valid }
  end
end

