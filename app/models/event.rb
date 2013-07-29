class Event < ActiveRecord::Base
  attr_accessible :end_datetime, :name, :start_datetime, :current, :donations_startdate
  has_many :items

#need to test the item bid information partial for when the auction ends
  def finished?
  	end_datetime <= DateTime.now
  end
end