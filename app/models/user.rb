class User < ActiveRecord::Base
  has_many :gift_cards

  attr_accessible :email, :dob, :first_name, :last_name

end
