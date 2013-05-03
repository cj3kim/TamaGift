class GiftCard < ActiveRecord::Base
  belongs_to :user

  attr_accessible :vendor, :card_value, :card_code,
    :recipient_email, :recipient_first_name, :recipient_last_name, :user
end
