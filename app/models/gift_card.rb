class GiftCard < ActiveRecord::Base
  belongs_to :user

  attr_accessible :vendor, :card_value, :card_code,
    :recipient_email, :recipient_first_name, :recipient_last_name, :user

  def get
  end

  def create
  end

  def card_value_in_dollars
  end

  def generate_card_code
  end
end
