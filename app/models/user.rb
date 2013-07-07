class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :address, :city, :state, :zip, :phone
  
  has_many :bids
  has_many :bid_items, :through => :bids, :source => :item
  
  has_many :donations
  has_many :donated_items, :through => :donations, :source => :item

end
