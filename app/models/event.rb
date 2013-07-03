class Event < ActiveRecord::Base
  attr_accessible :end_datetime, :name, :start_datetime, :current
  has_many :items
end
