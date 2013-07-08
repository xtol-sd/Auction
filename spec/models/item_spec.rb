require 'spec_helper'

describe Item do
  it { should respond_to(:event)}
  it { should respond_to(:user)}
  it { should respond_to(:bids)}
end
